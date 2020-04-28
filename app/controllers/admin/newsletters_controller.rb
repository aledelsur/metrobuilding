class Admin::NewslettersController < AdminController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  layout 'admin_newsletter'

  def index
    @newsletters = Newsletter.all
  end

  def show
    @user = User.first

    @budgets = Budget.where('due_date > ?', DateTime.now).all
    respond_to do |format|
      format.json { render json: @newsletter }
      format.html { render :show, layout: 'newsletter_show' }
    end
  end

  def new
    @newsletter = Newsletter.create(title: "Newsletter #{Newsletter.count + 1}")
    @newsletter.newsletter_sections.create(title: "Sección 1", description: "Escriba la descripción aquí")
    redirect_to edit_admin_newsletter_path(@newsletter), turbolinks: false
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def update
    if @newsletter.update(newsletter_params)
      render plain: 'ok'
    else
      render plain: 'Error'
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.present?
      @newsletter.destroy
      flash[:success] = "Newsletter eliminada correctamente."
    end
    redirect_to admin_newsletters_path
  end

  def sort_sections
    newsletter = Newsletter.find(params[:newsletter_id])
    params[:newsletter_section_ids].each_with_index do |id, index|
      newsletter.newsletter_sections.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  def send_newsletter
    newsletter = Newsletter.find(params[:newsletter_id])

    SendNewsletterJob.perform_later(newsletter.id, params[:selected_option], params[:user_ids])
    newsletter.update_attribute(:sent_at, DateTime.now)
    flash[:success] = 'Newsletter enviada correctamente.'
    redirect_to admin_newsletters_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_newsletter
    @newsletter = Newsletter.includes(:newsletter_sections).find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def newsletter_params
    params[:newsletter][:newsletter_sections_attributes] = params[:newsletter][:newsletter_sections]
    params.require(:newsletter).permit(:title, :email_content, newsletter_sections_attributes: [:id, :title, :description])
  end

end
