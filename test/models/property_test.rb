# == Schema Information
#
# Table name: properties
#
#  id                   :bigint           not null, primary key
#  apartment            :string
#  floor                :string
#  garage               :string
#  rooms                :string
#  section              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  property_category_id :integer
#  user_id              :integer
#

require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
