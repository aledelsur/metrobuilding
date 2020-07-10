class Admin::NewslettersController < AdminController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  layout 'admin_newsletter'

  def index
    raise 'Usuarios con permiso de solo lectura no pueden acceder a esta sección.' if current_admin_user.is_readonly?

    @newsletters = @project.newsletters
  end

  def show
    respond_to do |format|
      format.json { render json: @newsletter }
      format.html { render :show, layout: 'newsletter_show' }
    end
  end

  def new
    @newsletter = @project.newsletters.create(title: "Newsletter #{Newsletter.count + 1}")
    @newsletter.newsletter_sections.create(title: "Sección 1", description: "Escriba la descripción aquí", position: 1)
    redirect_to edit_admin_newsletter_path(@newsletter), turbolinks: false
  end

  def edit
    @newsletter = @project.newsletters.find(params[:id])
  end

  def update
    if @newsletter.update(newsletter_params)
      render plain: 'ok'
    else
      render plain: 'Error'
    end
  end

  def header_image
    newsletter = Newsletter.find(params[:newsletter_id])

    image_url = if newsletter.has_header_image?
                  url_for(newsletter.media_assets.first.image)
                else
                  ''
                end

    render json: image_url
  end

  def add_header_image
    newsletter = Newsletter.find(params[:newsletter_id])
    asset = MediaAsset.find(params[:id])

    newsletter.media_assets.destroy_all
    newsletter.media_assets << asset

    render json: MediaAsset.all, each_serializer: ::Admin::NewsletterHeaderMediaAssetSerializer, scope: { newsletter_id: params[:newsletter_id] }
  end

  def remove_header_image
    newsletter = Newsletter.find(params[:newsletter_id])
    asset = MediaAsset.find(params[:id])

    newsletter.media_assets.destroy_all

    render json: MediaAsset.all, each_serializer: ::Admin::NewsletterHeaderMediaAssetSerializer, scope: { newsletter_id: params[:newsletter_id] }
  end

  def destroy
    if @newsletter.present?
      @newsletter.destroy
      flash[:success] = "Circular Informativa eliminada correctamente."
    end
    redirect_to admin_newsletters_path
  end

  def sort_sections
    newsletter = @project.newsletters.find(params[:newsletter_id])
    params[:newsletter_section_ids].each_with_index do |id, index|
      newsletter.newsletter_sections.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  def send_newsletter
    newsletter = @project.newsletters.find(params[:newsletter_id])

    SendNewsletterJob.perform_later(newsletter.id, params[:selected_option], params[:user_ids], @company.id)
    newsletter.update_attribute(:sent_at, DateTime.now)
    flash[:success] = 'Circular Informativa enviada correctamente.'
    redirect_to admin_newsletters_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_newsletter
    @newsletter = @project.newsletters.includes(:newsletter_sections).find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def newsletter_params
    params[:newsletter][:newsletter_sections_attributes] = params[:newsletter][:newsletter_sections]
    params.require(:newsletter).permit(:title, :email_content, :main_color, newsletter_sections_attributes: [:id, :title, :description, :template_type])
  end

end
