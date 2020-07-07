# == Schema Information
#
# Table name: media_assets_newsletters
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  media_asset_id :bigint
#  newsletter_id  :bigint
#
# Indexes
#
#  index_media_assets_newsletters_on_media_asset_id  (media_asset_id)
#  index_media_assets_newsletters_on_newsletter_id   (newsletter_id)
#
require 'test_helper'

class MediaAssetsNewsletterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
