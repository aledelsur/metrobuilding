class SiteController < ApplicationController
  before_action :feature_enabled?, :authenticate_user!

  def feature_enabled?
    redirect_to admin_users_path unless @company.has_feature?(:client_portal)
  end
end
