desc "This task populates production database for Metro 19"
task :populate_metro19_production_data => :environment do
  # raise "RAILS_ENV is not development. This task can only be run in development environment." unless Rails.env.development?

  company = Company.create(name: 'metrobuilding')
  project = Project.create(name: 'metro19', company_id: company.id)

  return if company.nil? || project.nil?

  # Set up email settings for this project
  project.smtp_settings_address = 'smtp.gmail.com'
  project.smtp_settings_domain = 'gmail.com'
  project.smtp_settings_user_name = 'metrobuildingenvios@gmail.com'
  project.smtp_settings_password = 'sooaeeghkrujmivo'
  project.save!

  company.users.destroy_all
  user1 = company.users.create(email: 'mbinetti@metrobuilding.com.ar', first_name: 'Fideicomiso', last_name: 'M19', password: 'metroProp')
  project.users << user1

  user2 = company.users.create(email: 'aldo@brunetta.com.ar', first_name: 'Aldo', last_name: 'Brunetta', password: 'metroProp')
  project.users << user2

  user3 = company.users.create(email: 'msibione@maruba.com.ar', first_name: 'Marcelo', last_name: 'Sibbione', password: 'metroProp')
  project.users << user3

  user4 = company.users.create(email: 'vfeingold@contract.com.ar', first_name: 'Mucho', last_name: 'S.A.', password: 'metroProp')
  project.users << user4

  user5 = company.users.create(email: 'mrg@rodriguezgiesso.com.ar', first_name: 'Martin', last_name: 'Rodriguez Giesso', password: 'metroProp')
  project.users << user5

  user6 = company.users.create(email: 'arq.cgelbstein@gmail.com', first_name: 'Cecilia', last_name: 'Gelbstein', password: 'metroProp')
  project.users << user6

  user7 = company.users.create(email: 'gescolar@gmail.com', first_name: 'Guillermo', last_name: 'Escolar', password: 'metroProp')
  project.users << user7

  user8 = company.users.create(email: 'mirene@campoamor.com.ar', first_name: 'María Irene', last_name: 'Campoamor', password: 'metroProp')
  project.users << user8

  user9 = company.users.create(email: 'smilberg@milbergsa.com', first_name: 'Simón', last_name: 'Milberg', password: 'metroProp')
  project.users << user9

  user10 = company.users.create(email: 'marcelo@mrconsultores.com.ar', first_name: 'Marcelo', last_name: 'Rodriguez', password: 'metroProp')
  project.users << user10

  user11 = company.users.create(email: 'PabloG@tangosoft.com.ar', first_name: 'Pablo', last_name: 'Gelbstein', password: 'metroProp')
  project.users << user11
  puts "11 propietarios creados en Metro 19"

  PropertyCategory.where(company_id: company.id, project_id: project.id).destroy_all
  cat1 = PropertyCategory.create(name: 'cochera PB', percentage: 0.75, company_id: company.id, project_id: project.id)
  cat2 = PropertyCategory.create(name: 'cochera subsuelo', percentage: 0.68, company_id: company.id, project_id: project.id)
  cat3 = PropertyCategory.create(name: '802', percentage: 5.99, company_id: company.id, project_id: project.id)
  cat4 = PropertyCategory.create(name: '202/801', percentage: 5.17, company_id: company.id, project_id: project.id)
  cat5 = PropertyCategory.create(name: '702/501', percentage: 5.68, company_id: company.id, project_id: project.id)
  cat6 = PropertyCategory.create(name: '701', percentage: 5.89, company_id: company.id, project_id: project.id)
  cat7 = PropertyCategory.create(name: '602/401/101', percentage: 5.58, company_id: company.id, project_id: project.id)
  cat8 = PropertyCategory.create(name: '601', percentage: 5.79, company_id: company.id, project_id: project.id)
  cat9 = PropertyCategory.create(name: '502/301/102', percentage: 5.48, company_id: company.id, project_id: project.id)
  cat10 = PropertyCategory.create(name: '402/201', percentage: 5.37, company_id: company.id, project_id: project.id)
  cat11 = PropertyCategory.create(name: '302', percentage: 5.27, company_id: company.id, project_id: project.id)
  puts "11 Property Categories creadas en Metro 19"

  project.properties.destroy_all
  project.properties.create(property_category: cat7, apartment: 'Unidad 101', user: user1, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat9, apartment: 'Unidad 102', user: user1, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat10, apartment: 'Unidad 201', user: user2, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat4, apartment: 'Unidad 202', user: user2, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat9, apartment: 'Unidad 301', user: user1, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat11, apartment: 'Unidad 302', user: user3, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat7, apartment: 'Unidad 401', user: user4, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat10, apartment: 'Unidad 402', user: user5, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat5, apartment: 'Unidad 501', user: user6, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat9, apartment: 'Unidad 502', user: user1, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat8, apartment: 'Unidad 601', user: user7, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat7, apartment: 'Unidad 602', user: user8, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat6, apartment: 'Unidad 701', user: user9, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat5, apartment: 'Unidad 702', user: user1, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat4, apartment: 'Unidad 801', user: user10, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat3, apartment: 'Unidad 802', user: user11, company_id: company.id, project_id: project.id)
  puts "16 propiedades creadas en Metro 19"

  project.properties.create(property_category: cat1, apartment: 'Cochera PB 1', user: user1, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat1, apartment: 'Cochera PB 2', user: user4, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat1, apartment: 'Cochera PB 3', user: user7, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat1, apartment: 'Cochera PB 4', user: user9, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat1, apartment: 'Cochera PB 5', user: user1, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat1, apartment: 'Cochera PB 6', user: user2, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat1, apartment: 'Cochera PB 7', user: user1, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat1, apartment: 'Cochera PB 8', user: user1, company_id: company.id, project_id: project.id)
  puts "8 cocheras PB creadas en Metro 19"

  project.properties.create(property_category: cat2, apartment: 'Cochera SUB 9', user: user1, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat2, apartment: 'Cochera SUB 10', user: user3, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat2, apartment: 'Cochera SUB 11', user: user2, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat2, apartment: 'Cochera SUB 12', user: user6, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat2, apartment: 'Cochera SUB 13', user: user8, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat2, apartment: 'Cochera SUB 14', user: user11, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat2, apartment: 'Cochera SUB 15', user: user5, company_id: company.id, project_id: project.id)
  project.properties.create(property_category: cat2, apartment: 'Cochera SUB 16', user: user10, company_id: company.id, project_id: project.id)
  puts "8 cocheras SUBSUELO creadas en Metro 19"
end
