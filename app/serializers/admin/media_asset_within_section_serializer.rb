class Admin::MediaAssetWithinSectionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes  :id,
              :image,
              :description

  def image
    url_for(object.image)
  end
end