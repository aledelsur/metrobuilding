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
    @newsletter.newsletter_sections.build
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    respond_to do |format|
      if @newsletter.save
        @newsletter.images.attach(params[:newsletter][:images])
        format.html { redirect_to edit_admin_newsletter_path(@newsletter) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @newsletter.update(newsletter_params)
        format.html { redirect_to edit_admin_newsletter_path(@newsletter) }
      else
        @newsletter = Newsletter.new
        format.html { render :edit }
      end
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
