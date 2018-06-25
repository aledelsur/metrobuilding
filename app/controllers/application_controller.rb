class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'marolo', password: 'Cata1234!'
end
