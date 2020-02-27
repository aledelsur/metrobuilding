# == Schema Information
#
# Table name: images
#
#  id                    :bigint           not null, primary key
#  url                   :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  newsletter_section_id :integer
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
