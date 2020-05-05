desc "This rake task hides the features that are not required at this moment by the company"
# rake prepare_features_for_company['Scotto']
# rake prepare_features_for_company['metrobuilding']
task :prepare_features_for_company, [:company] => [:environment] do |task, args|
  company = Company.find_by(name: args[:company])

  case company.name
  when 'Scotto' # Ayres de Canning
    # Disable newsletters feature
    newsletters_feature = company.company_features.where(feature: 'newsletters').first
    newsletters_feature.boolean_value = false
    newsletters_feature.save

    # Disable newsletters history feature
    newsletters_history_feature = company.company_features.where(feature: 'newsletters_history').first
    newsletters_history_feature.boolean_value = false
    newsletters_history_feature.save

    # Disable budget rates feature
    budget_rates_feature = company.company_features.where(feature: 'budget_rates').first
    budget_rates_feature.boolean_value = false
    budget_rates_feature.save

  when 'metrobuilding'
    # Disable payments feature
    payments_feature = company.company_features.where(feature: 'payments').first
    payments_feature.boolean_value = false
    payments_feature.save

    # Disable client portal feature
    client_portal_feature = company.company_features.where(feature: 'client_portal').first
    client_portal_feature.boolean_value = false
    client_portal_feature.save
  end
end