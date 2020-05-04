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
class CompanyFeature < ApplicationRecord
  include Concerns::Feature

  # relationships
  belongs_to :company

  # validation
  validates :company, presence: true
  validates :feature, uniqueness: { scope: :company_id }
end

