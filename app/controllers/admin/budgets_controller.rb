class Admin::BudgetsController < AdminController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.all.order('id desc')
  end

  # # GET /budgets/1
  # # GET /budgets/1.json
  # def show
  # end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  # # GET /budgets/1/edit
  # def edit
  # end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(budget_params)

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
  #
  # # PATCH/PUT /budgets/1
  # # PATCH/PUT /budgets/1.json
  # def update
  #   respond_to do |format|
  #     if @budget.update(budget_params)
  #       format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @budget }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @budget.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
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
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:value, :due_date, :dollar_against_peso_value)
  end
end
