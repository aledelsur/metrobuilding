# == Schema Information
#
# Table name: property_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  percentage :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#  project_id :bigint
#

require 'test_helper'

class PropertyCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
