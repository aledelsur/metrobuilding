class Admin::DebtsController < AdminController
  before_action :set_debt, only: [:show, :edit, :update, :destroy]

  # GET /debts
  # GET /debts.json
  def index
    @debts = Debt.all.order('id desc')
  end

  # # GET /debts/1
  # # GET /debts/1.json
  # def show
  # end

  # GET /debts/new
  def new
    @debt = Debt.new
    @properties = Property.all
  end

  def edit
    @debt = Debt.find(params[:id])
    @property_ids = @debt.properties.pluck(:id).join(',')
    @properties = Property.all
  end

  # # GET /debts/1/edit
  # def edit
  # end

  # POST /debts
  # POST /debts.json
  def create
    @debt = Debt.new(debt_params)

    respond_to do |format|
      if @debt.save
        format.html { redirect_to admin_debts_path, notice: 'Debt was successfully created.' }
      else
        @debt = Debt.new
        @properties = Property.all
        format.html { render :new }
      end
    end
  end
  #
  # # PATCH/PUT /debts/1
  # # PATCH/PUT /debts/1.json
  def update
    respond_to do |format|
      if @debt.update(debt_params)
        format.html { redirect_to admin_debts_path, notice: 'Debt was successfully updated.' }
        format.json { render :index, status: :ok, location: @debt }
      else
        @debt = Debt.new
        @property_ids = @debt.properties.pluck(:id).join(',')
        @properties = Property.all
        format.html { render :edit }
        format.json { render json: @debt.errors, status: :unprocessable_entity }
      end
    end
  end
  #
  # DELETE /debts/1
  # DELETE /debts/1.json
  def destroy
    @debt.destroy
    respond_to do |format|
      format.html { redirect_to admin_debts_url, notice: 'Debt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = Debt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debt_params
      params.require(:debt).permit(:description, :amount, :property_ids, :currency)
    end
end
