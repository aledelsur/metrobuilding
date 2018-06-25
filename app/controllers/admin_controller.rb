class AdminController < ApplicationController
  http_basic_authenticate_with name: 'marolo', password: 'Cata1234!'
  layout 'admin'
end
