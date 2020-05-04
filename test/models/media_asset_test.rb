# == Schema Information
#
# Table name: media_assets
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint
#  project_id  :bigint
#
require 'test_helper'

class MediaAssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
