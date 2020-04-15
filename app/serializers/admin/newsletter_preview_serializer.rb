class Admin::NewsletterPreviewSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes  :id,
              :title,
              :sent,
              :created_at,
              :updated_at,
              :logo_url,
              :main_image

  has_many :newsletter_sections

  def logo_url
    ActionController::Base.helpers.asset_path("/images/logo-metro.png")
  end

  def main_image
    ActionController::Base.helpers.asset_path("/images/metrobuilding-portada-photo.jpg")
  end
end