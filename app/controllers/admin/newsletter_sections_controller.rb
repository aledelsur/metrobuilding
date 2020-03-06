class Admin::NewsletterSectionsController < AdminController
  before_action :set_newsletter, only: [:create]
  skip_before_action :verify_authenticity_token

  def create
    newsletter_section = @newsletter.newsletter_sections.create(title: "Sección 2", description: "Escriba la descripción aquí")
    render json: newsletter_section
  end

  private

  def set_newsletter
    @newsletter ||= Newsletter.find(params[:newsletter_id])
  end

  def section_params
    params.require(:newsletter_section).permit(:title, :description)
  end
end