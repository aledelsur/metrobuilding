class Admin::NewslettersController < ApplicationController

  def index
    @newsletters = Newsletter.all
  end
end
