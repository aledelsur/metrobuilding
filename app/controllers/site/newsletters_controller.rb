class Site::NewslettersController < ApplicationController
  layout 'newsletter'

  def show
    @newsletter = Newsletter.find(params[:id])
  end
end
