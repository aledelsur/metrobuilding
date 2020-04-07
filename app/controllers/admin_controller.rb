class AdminController < ApplicationController
  http_basic_authenticate_with name: configatron.admin_user, password: configatron.admin_password
  layout 'admin'
end
