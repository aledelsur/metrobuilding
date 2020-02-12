class Site::PaymentsController < SiteController

  def index
    @payments = current_user.payments.where(payment_type: params[:payment_type])
  end

end
