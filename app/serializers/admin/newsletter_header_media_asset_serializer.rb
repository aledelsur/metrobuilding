class Admin::NewsletterHeaderMediaAssetSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes  :id,
              :image,
              :description,
              :is_added

  def image
    url_for(object.image)
  end

  def is_added
    record = MediaAssetsNewsletter.where(media_asset_id: object.id,
                                          newsletter_id: scope[:newsletter_id])
                                         .first
    record.present? ? true : false
  end
end 
