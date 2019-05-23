class Admin::ReceiptsController < AdminController
  before_action :set_admin_receipt, only: [:show, :edit, :update, :destroy]

  # GET /admin/receipts
  # GET /admin/receipts.json
  def index
    if params[:payments]
      @receipts = Receipt.where.not(payment_id: nil)
    else
      @receipts = Receipt.where(payment_id: nil)
    end
    @receipts = @receipts.includes(payment: [:properties])

    respond_to do |format|
      format.html
      format.csv { send_data @receipts.to_csv, filename: "Recibos-#{Date.today}.csv" }
    end
  end

  # GET /admin/receipts/1
  # GET /admin/receipts/1.json
  def show
  end

  # GET /admin/receipts/new
  def new
    if params[:payment_id].present?
      @payment = Payment.find(params[:payment_id])
      @receipt = @payment.receipts.new
    else
      @receipt = Receipt.new
    end
  end

  # GET /admin/receipts/1/edit
  def edit
  end

  # POST /admin/receipts
  # POST /admin/receipts.json
  def create
    @receipt = Receipt.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to [:admin, @receipt], notice: 'Receipt was successfully created.' }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/receipts/1
  # PATCH/PUT /admin/receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to [:admin, @receipt], notice: 'Receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/receipts/1
  # DELETE /admin/receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to admin_receipts_url, notice: 'Receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:value, :payment_id, :name, :month, :year, :concept)
    end
end
