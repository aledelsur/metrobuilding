# == Schema Information
#
# Table name: company_features
#
#  id             :bigint           not null, primary key
#  boolean_value  :boolean          default("true")
#  datetime_value :datetime
#  feature        :integer
#  integer_value  :integer
#  string_value   :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :bigint
#
# Indexes
#
#  index_company_features_on_company_id  (company_id)
#
require 'test_helper'

class CompanyFeatureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
