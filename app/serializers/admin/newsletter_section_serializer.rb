class Admin::NewsletterSectionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes  :id,
              :newsletter_id,
              :title,
              :description,
              :position,
              :media_assets,
              :created_at,
              :updated_at

  def media_assets
    object.media_assets.map do |asset|
      Admin::MediaAssetWithinSectionSerializer.new(asset)
    end
  end
end