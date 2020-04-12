# == Schema Information
#
# Table name: media_assets_newsletter_sections
#
#  id                    :bigint           not null, primary key
#  media_asset_id        :bigint
#  newsletter_section_id :bigint
#
# Indexes
#
#  index_media_assets_newsletter_sections_on_media_asset_id         (media_asset_id)
#  index_media_assets_newsletter_sections_on_newsletter_section_id  (newsletter_section_id)
#
class MediaAssetsNewsletterSection < ApplicationRecord
end
