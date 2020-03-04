class Admin::NewslettersController < AdminController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]

  def index
    @newsletters = Newsletter.all
  end

  def show
  end

  def new
    @newsletter = Newsletter.new
    @newsletter.newsletter_sections.build
  end

  def edit
    @newsletter = Newsletter.find(params[:id])

    if params[:new_section].present?
      @newsletter.newsletter_sections.build
    end
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save
      # @newsletter.images.attach(params[:newsletter][:images])
      if params[:finish].present?
        redirect_to admin_newsletters_path
      else
        redirect_to edit_admin_newsletter_path(@newsletter, new_section: true) # redirect to edit view and build blank section
      end
    else
      render :new
    end
  end

  def update
    if @newsletter.update(newsletter_params)
      if params[:finish].present?
        redirect_to admin_newsletters_path # redirect to index view
      else
        redirect_to edit_admin_newsletter_path(@newsletter, new_section: true) # redirect to edit view and build blank section
      end
    else
      @newsletter = Newsletter.new
      render :edit
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.present?
      @newsletter.destroy
    end
    redirect_to admin_newsletters_path, notice: 'Circular eliminada correctamente.'
  end

  def remove_section
    @newsletter = Newsletter.find(params[:newsletter_id])
    @newsletter.newsletter_sections.find(params[:id]).destroy
    redirect_to edit_admin_newsletter_path(@newsletter)
  end

  def sort_sections
    newsletter = Newsletter.find(params[:newsletter_id])
    params[:newsletter_section].each_with_index do |id, index|
      newsletter.newsletter_sections.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def newsletter_params
    params.require(:newsletter).permit(:title, newsletter_sections_attributes: [:id, :title, :description])
  end

end
