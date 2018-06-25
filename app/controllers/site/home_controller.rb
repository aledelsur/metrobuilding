class Site::HomeController < SiteController

  def index
    @payments = current_user.payments
  end

end
