class Admin::MediaAssetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes  :id,
              :image,
              :description,
              :is_added

  def image
    url_for(object.image)
  end

  def is_added
    record = MediaAssetsNewsletterSection.where(media_asset_id: object.id, newsletter_section_id: scope[:section_id]).first
    record.present? ? true : false
  end
end