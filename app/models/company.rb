# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  include Concerns::Feature

  has_many :projects
  has_many :users
  has_many :company_features

  after_create :create_company_features

  def has_feature?(feature)
    feature_code = CompanyFeature.features[feature]
    raise 'Feature not found' unless feature_code
    company_feature = company_features.where(feature: feature_code).first

    if company_feature.nil?
      raise "Company #{company_name} does not have a feature record for #{feature_code}"
    end

    raise 'Value type is not Boolean' unless company_feature.value_type == 'Boolean'
    company_feature.boolean_value
  end

  def feature_string_value(feature)
    feature_code = CompanyFeature.features[feature]
    raise 'Feature not found' unless feature_code
    company_feature = company_features.where(feature: feature_code).first

    if company_feature.nil?
      raise "Company #{company_name} does not have a feature record for #{feature_code}"
    end

    raise 'Value type is not String' unless company_feature.value_type == 'String'
    company_feature.string_value
  end

  private

  def create_company_features
    FEATURES_DATA.each do |feature_key, feature_value|
      company_features.create(
          feature: feature_key,
          boolean_value: (feature_value_type(feature_key) == 'Boolean' ? feature_default_value(feature_key) : nil),
          string_value: (feature_value_type(feature_key) == 'String' ? feature_default_value(feature_key) : nil)
      )
    end
  end
end
