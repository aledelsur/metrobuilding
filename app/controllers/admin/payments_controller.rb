class Admin::PaymentsController < AdminController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = @project.payments.includes(:properties, :user, :receipts)
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @user = @project.users.find(params[:user_id])
    @payment = @user.payments.new
    @properties = @user.properties
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = @project.payments.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to [:admin, @payment], notice: 'Payment was successfully created.' }
        format.json
        format.js
      else
        @user = @payment.user
        @properties = @user.properties
        format.html { render :new }
        format.json
        format.js
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to [:admin, @payment], notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to admin_payments_path, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = @project.payments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params[:payment][:property_ids] = [params[:payment][:property_ids]]
      params.require(:payment).permit(:value, :user_id, :payment_type, :dollar_against_peso_value, property_ids: [])
    end
end
