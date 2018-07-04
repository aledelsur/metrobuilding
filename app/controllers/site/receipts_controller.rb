class Site::ReceiptsController < SiteController
  before_action :set_receipt, only: [:show]

  # GET /admin/receipts
  # GET /admin/receipts.json
  def index
    @receipts = current_user.receipts
  end

  # GET /admin/receipts/1
  # GET /admin/receipts/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_receipt
    @receipt = current_user.receipts.find(params[:id])
  end
end
