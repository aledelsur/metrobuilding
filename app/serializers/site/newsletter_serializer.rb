class Site::NewsletterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes  :id,
              :title,
              :sent_at,
              :created_at,
              :updated_at,
              :logo_url,
              :main_image,
              :investor_name,
              :current_debt

  has_many :newsletter_sections

  def investor_name
    byebug
    sent_newsletter = SentNewsletter.find(scope[:sent_newsletter_id])
    sent_newsletter.investor_name
  end

  def current_debt
    sent_newsletter = SentNewsletter.find(scope[:sent_newsletter_id])
    sent_newsletter.current_debt
  end

  def logo_url
    ActionController::Base.helpers.asset_path("logo-metro.png")
  end

  def main_image
    ActionController::Base.helpers.asset_path("metrobuilding-portada-photo.jpg")
  end
end