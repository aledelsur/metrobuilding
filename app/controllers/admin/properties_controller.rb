class Admin::PropertiesController < AdminController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = @project.properties
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = @project.properties.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = @project.properties.new(property_params)

    respond_to do |format|
      if @property.save
        flash[:success] = "Propiedad creada correctamente."
        format.html { redirect_to [:admin, @property] }
        format.json { render :show, status: :created, location: @property }
      else
        flash[:error] = "Los siguientes errores no permiten guardar la información:"
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        flash[:success] = "Propiedad actualizada correctamente."
        format.html { redirect_to admin_properties_path }
        format.json { render :show, status: :ok, location: @property }
      else
        flash[:error] = "Los siguientes errores no permiten guardar la información:"
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      flash[:success] = "Propiedad eliminada correctamente."
      format.html { redirect_to admin_properties_path }
      format.json { head :no_content }
    end
  end

  private

  def set_property
    @property = @project.properties.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:property_category_id, :user_id, :garage)
  end
end
