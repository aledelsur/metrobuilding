class Admin::MediaAssetsController < AdminController
  before_action :set_media_asset, only: [:destroy, :edit, :update]

  def index
    if params[:pagination]
      @per_page = params[:per_page].to_i || 10
      @current_page = params[:current_page].to_i || 1
      @total = @project.media_assets.count

      offset = (@current_page * @per_page) - @per_page
      @media_assets = @project.media_assets.includes(image_attachment: :blob)
                              .offset(offset).limit(@per_page).order(:created_at)
    else
      @media_assets = @project.media_assets
    end

    @media_asset = MediaAsset.new

    respond_to do |format|
      if params[:pagination]
        format.json { render(json: pagination_settings, serializer: ::Admin::PaginatorSerializer) }
      elsif params[:newsletter_section_id]
        format.json { render(json: @media_assets, each_serializer: ::Admin::MediaAssetSerializer,
                                                  scope: { section_id: params[:newsletter_section_id] }) }
      end

      format.html
    end
  end

  def new
    @media_asset = @project.media_assets.new
  end

  def create
    @media_asset = @project.media_assets.new(media_asset_parms)

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
    @media_asset = @project.media_assets.find(params[:id])

    if @media_asset.present?
      flash[:success] = "Imagen eliminada correctamente."
      @media_asset.destroy
    end
    redirect_to admin_media_assets_path
  end

  private

  def set_media_asset
    @media_asset = @project.media_assets.find(params[:id])
  end

  def media_asset_parms
    params.require(:media_asset).permit(:image, :description)
  end

  def pagination_settings

    if params[:newsletter_id] # used when user is changing Header Image of the Newsletter
      PaginationSetting.new(@per_page,
                            @current_page,
                            @media_assets,
                            @total,
                            ::Admin::NewsletterHeaderMediaAssetSerializer,
                            newsletter_id: params[:newsletter_id])
    elsif params[:newsletter_section_id] # used when user is changing an image within a section of the Newsletter
      PaginationSetting.new(@per_page,
                            @current_page,
                            @media_assets,
                            @total,
                            ::Admin::MediaAssetSerializer,
                            section_id: params[:newsletter_section_id])
    end
  end
end
