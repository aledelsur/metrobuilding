class Admin::BudgetsController < AdminController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = @project.budgets.order('id desc')
  end

  # # GET /budgets/1
  # # GET /budgets/1.json
  # def show
  # end

  # GET /budgets/new
  def new
    @budget = @project.budgets.new
  end

  # # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = @project.budgets.new(budget_params)

    respond_to do |format|
      if @budget.save
        flash[:success] = "Base de cálculo creada correctamente."
        format.html { redirect_to admin_budgets_path }
      else
        flash[:error] = "Los siguientes errores no permiten guardar la información:"
        format.html { render :new }
      end
    end
  end

  # # PATCH/PUT /budgets/1
  # # PATCH/PUT /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        flash[:success] = "Base de cálculo actualizada correctamente."
        format.html { redirect_to admin_budgets_path }
        format.json { render :show, status: :ok, location: @budget }
      else
        flash[:error] = "Los siguientes errores no permiten guardar la información:"
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      flash[:success] = "Base de cálculo eliminada correctamente."
      format.html { redirect_to admin_budgets_url }
      format.json { head :no_content }
    end
  end

  private

  def set_budget
    @budget = @project.budgets.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:value, :rate_1, :rate_2, :start_date, :due_date, :dollar_against_peso_value)
  end
end
