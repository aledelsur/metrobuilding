class AddCompanyAndProjectIds < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_id, :bigint

    add_column :budgets, :project_id, :bigint
    add_column :budgets, :company_id, :bigint

    add_column :debts, :project_id, :bigint
    add_column :debts, :company_id, :bigint

    add_column :receipts, :project_id, :bigint
    add_column :receipts, :company_id, :bigint

    add_column :media_assets, :project_id, :bigint
    add_column :media_assets, :company_id, :bigint

    add_column :newsletters, :project_id, :bigint
    add_column :newsletters, :company_id, :bigint

    add_column :payments, :project_id, :bigint
    add_column :payments, :company_id, :bigint

    add_column :property_categories, :project_id, :bigint
    add_column :property_categories, :company_id, :bigint

    add_column :properties, :project_id, :bigint
    add_column :properties, :company_id, :bigint

    add_column :sent_newsletters, :project_id, :bigint
    add_column :sent_newsletters, :company_id, :bigint

    add_column :admin_users, :project_id, :bigint
    add_column :admin_users, :company_id, :bigint

    populate_existing_company
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
