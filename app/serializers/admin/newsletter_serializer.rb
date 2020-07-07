class Admin::NewsletterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes  :id,
              :title,
              :sent_at,
              :created_at,
              :updated_at,
              :logo_url,
              :main_image,
              :email_content

  has_many :newsletter_sections

  def logo_url
    ActionController::Base.helpers.asset_path("logo-metro.png")
  end

  def main_image
    if object.has_header_image?
      url_for(object.media_assets.first.image)
    else
      ActionController::Base.helpers.asset_path("metrobuilding-portada-photo.jpg")
    end
  end
end
