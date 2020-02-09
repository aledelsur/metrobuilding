class Site::DebtsController < SiteController
  before_action :set_property, only: [:show]

  def index
    @debts = current_user.debts
  end
end