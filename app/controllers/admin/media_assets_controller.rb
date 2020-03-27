class Admin::MediaAssetsController < AdminController
  before_action :set_media_asset, only: [:destroy]

  def index
    @media_assets = MediaAsset.all
    @media_asset = MediaAsset.new

    respond_to do |format|
      format.json { render json: @media_assets, each_serializer: ::Admin::MediaAssetSerializer, scope: { section_id: params[:newsletter_section_id] } }
      format.html
    end
  end

  def create
    @media_asset = MediaAsset.create(media_asset_parms)
    redirect_to admin_media_assets_path
  end

  def destroy
    @media_asset = MediaAsset.find(params[:id])

    if @media_asset.present?
      @media_asset.destroy
    end
    redirect_to admin_media_assets_path
  end

  private

  def set_media_asset
    @media_asset = MediaAsset.find(params[:id])
  end

  def media_asset_parms
    params.require(:media_asset).permit(:image)
  end
end
