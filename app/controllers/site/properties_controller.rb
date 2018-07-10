class Site::PropertiesController < SiteController
  before_action :set_property, only: [:show]

  def index
    @properties = current_user.properties
  end

  def show
    @payments = @property.payments
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = current_user.properties.find(params[:id])
  end
end
