class Admin::NewslettersController < AdminController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]

  def index
    @newsletters = Newsletter.all
  end

  def show
  end

  def new
    @newsletter = Newsletter.new
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to admin_newsletters_path, notice: 'Circular creada correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @newsletter.update(newsletter_params)
        format.html { redirect_to admin_newsletters_path, notice: 'Circular actualizada correctamente.' }
        format.json { render :index, status: :ok, location: @debt }
      else
        @newsletter = Newsletter.new
        format.html { render :edit }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:id, :title, :created_at)
    end

end
