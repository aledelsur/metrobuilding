class Admin::NewsletterSectionsController < AdminController
  before_action :set_newsletter, only: [:create, :add_media_asset, :remove_media_asset]
  skip_before_action :verify_authenticity_token

  def create
    section_number = @newsletter.newsletter_sections.size + 1
    newsletter_section = @newsletter.newsletter_sections.create(title: "Sección #{section_number}", description: "Escriba la descripción aquí")
    render json: newsletter_section
  end

  def media_assets
    newsletter_section = NewsletterSection.find(params[:newsletter_section_id])

    render json: newsletter_section.media_assets, each_serializer: ::Admin::MediaAssetWithinSectionSerializer
  end

  def add_media_asset
    asset = MediaAsset.find(params[:id])
    newsletter_section = @newsletter.newsletter_sections.find(params[:newsletter_section_id])
    newsletter_section.media_assets << asset

    render json: MediaAsset.all, each_serializer: ::Admin::MediaAssetSerializer, scope: { section_id: params[:newsletter_section_id] }
  end

  def remove_media_asset
    asset = MediaAsset.find(params[:id])
    newsletter_section = @newsletter.newsletter_sections.find(params[:newsletter_section_id])
    newsletter_section.media_assets.delete(asset)

    render json: MediaAsset.all, each_serializer: ::Admin::MediaAssetSerializer, scope: { section_id: params[:newsletter_section_id] }
  end

  def destroy
    @newsletter = Newsletter.find(params[:newsletter_id])
    @newsletter.newsletter_sections.find(params[:id]).destroy

    render json: @newsletter.newsletter_sections
  end

  private

  def set_newsletter
    @newsletter ||= Newsletter.find(params[:newsletter_id])
  end

  def section_params
    params.require(:newsletter_section).permit(:title, :description)
  end
end
