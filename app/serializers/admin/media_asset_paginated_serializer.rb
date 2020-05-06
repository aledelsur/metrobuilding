class Admin::MediaAssetPaginatedSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes  :nested

  def nested
    {
      nested: {
        data: ,
        current_page: current_page,
        last_page: last_page,
        prev_page_url: prev_page_url
      }
    }
  end

  def image
    url_for(object.image)
  end

  def is_added
    record = MediaAssetsNewsletterSection.where(media_asset_id: object.id, newsletter_section_id: scope[:section_id]).first
    record.present? ? true : false
  end

  def current_page
    1
  end

  def last_page
    2
  end

  def prev_page_url
    'www.google.com'
  end
end