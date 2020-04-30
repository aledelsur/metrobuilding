class AdminController < ApplicationController
  # http_basic_authenticate_with name: configatron.admin_user, password: configatron.admin_password
  before_action :authenticate_admin_user!
  layout 'admin'

  # TODO: esto va a impactar en Ayres de Canning porque el modelo que usa es User y en MetroBuilding usamos AdminUser.
  # Hacer un metodo para autenticar a un modelo o a otro dependiendo de configatron
end
