class Admin::MediaAssetsController < AdminController
  before_action :set_media_asset, only: [:destroy, :edit, :update]

  def index
    @media_assets = MediaAsset.all
    @media_asset = MediaAsset.new

    respond_to do |format|
      format.json { render json: @media_assets, each_serializer: ::Admin::MediaAssetSerializer, scope: { section_id: params[:newsletter_section_id] } }
      format.html
    end
  end

  def new
    @media_asset = MediaAsset.new
  end

  def create
    @media_asset = MediaAsset.new(media_asset_parms)

    if @media_asset.save
      flash[:success] = "Imagen agregada correctamente."
      redirect_to admin_media_assets_path
    else
      flash[:error] = "Los siguientes errores no permiten guardar la información:"
      render :edit
    end
  end

  def update
    if @media_asset.update(media_asset_parms)
      flash[:success] = "Imagen actualizada correctamente."
      redirect_to admin_media_assets_path
    else
      flash[:error] = "Los siguientes errores no permiten guardar la información:"
      render :edit
    end
  end

  def destroy
    @media_asset = MediaAsset.find(params[:id])

    if @media_asset.present?
      flash[:success] = "Imagen eliminada correctamente."
      @media_asset.destroy
    end
    redirect_to admin_media_assets_path
  end

  private

  def set_media_asset
    @media_asset = MediaAsset.find(params[:id])
  end

  def media_asset_parms
    params.require(:media_asset).permit(:image, :description)
  end
end
