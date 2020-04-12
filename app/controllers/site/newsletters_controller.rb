class Site::NewslettersController < ApplicationController
  layout 'newsletter'

  def show
    @newsletter = Newsletter.find(params[:id])
    @user = User.find(params[:user])
  end
end
