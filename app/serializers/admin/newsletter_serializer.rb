class Admin::NewsletterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes  :id,
              :title,
              :sent,
              :created_at,
              :updated_at

  has_many :newsletter_sections
end