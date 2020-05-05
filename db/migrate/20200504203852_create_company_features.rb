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

    populate_existing_company

    Company.all.each do |company|
      FEATURES.each do |feature_key|
        next if company.company_features.find_by(feature: feature_key)

        company.company_features.create(
          feature: feature_key,
          boolean_value: (Company.feature_value_type(feature_key) == 'Boolean' ? Company.feature_default_value(feature_key) : nil),
          string_value: (Company.feature_value_type(feature_key) == 'String' ? Company.feature_default_value(feature_key) : nil)
        )
      end
    end
  end

  def populate_existing_company
    company = Company.create(name: 'Scotto')
    project = Project.create(name: 'ayres-de-canning', company_id: company.id)

    User.update_all(company_id: company.id)
    Budget.update_all(company_id: company.id, project_id: project.id)
    Debt.update_all(company_id: company.id, project_id: project.id)
    Property.update_all(company_id: company.id, project_id: project.id)
    Payment.update_all(company_id: company.id, project_id: project.id)
    PropertyCategory.update_all(company_id: company.id, project_id: project.id)
    MediaAsset.update_all(company_id: company.id, project_id: project.id)
    Receipt.update_all(company_id: company.id, project_id: project.id)
    Newsletter.update_all(company_id: company.id, project_id: project.id)
    SentNewsletter.update_all(company_id: company.id, project_id: project.id)
    AdminUser.update_all(company_id: company.id, project_id: project.id)

    User.all.each do |user|
      UserProject.create(user_id: user.id, project_id: project.id)
    end
  end
end
