class Site::PaymentsController < SiteController

  def index
    @payments = current_user.payments
  end

end
