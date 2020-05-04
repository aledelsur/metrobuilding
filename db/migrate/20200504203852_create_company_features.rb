class CreateCompanyFeatures < ActiveRecord::Migration[5.2]
  FEATURES = [:logo, :payments, :newsletters, :newsletters_history, :client_portal, :budget_rates, :intranet_name].freeze

  def change
    create_table :company_features do |t|
      t.belongs_to :company, index: true
      t.boolean  :boolean_value, default: true
      t.integer  :integer_value
      t.datetime :datetime_value
      t.string   :string_value
      t.integer  :feature
      t.timestamps
    end

    Company.all.each do |company|
      FEATURES.each do |feature_key|
        company.company_features.create(
          feature: feature_key,
          boolean_value: (Company.feature_value_type(feature_key) == 'Boolean' ? Company.feature_default_value(feature_key) : nil),
          string_value: (Company.feature_value_type(feature_key) == 'String' ? Company.feature_default_value(feature_key) : nil)
        )
      end
    end
  end
end
