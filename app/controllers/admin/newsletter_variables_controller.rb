class Admin::NewsletterVariablesController < AdminController
  skip_before_action :verify_authenticity_token

  def index
    render json: NewsletterVariable.list
  end

end