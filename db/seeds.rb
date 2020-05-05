# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# unless PropertyCategory.any?
#   PropertyCategory.create(percentage: 0.72, name: 'Grande Adentro')
#   PropertyCategory.create(percentage: 0.68, name: 'Grande Afuera')
#   PropertyCategory.create(percentage: 0.51, name: 'Chico Adentro')
#   PropertyCategory.create(percentage: 0.48, name: 'Chico Afuera')
# end

# require 'import_csv'

# ImportCSV.new(Rails.root.to_s + '/lib/propietarios.csv')

raise "RAILS_ENV is not development. This task can only be run in development environment." unless Rails.env.development?

company_ayres_de_canning = Company.where(name: 'Scotto').first_or_create!
puts "Created Company for Ayres de Canning"
company_metrobuilding = Company.where(name: 'metrobuilding').first_or_create!
puts "Created Company for Metrobuilding"

project_ayres_de_canning = Project.where(name: 'ayres-de-canning', company_id: company_ayres_de_canning.id).first_or_create!
puts "Created Project for Ayres de Canning"
project_metro19 = Project.where(name: 'metro19', company_id: company_metrobuilding.id).first_or_create!
puts "Created Project for Metro19"


AdminUser.where(email: 'marolo@example.com').first_or_create!(email: 'marolo@example.com',
                                                                  password: 'marolo',
                                                                  company: company_ayres_de_canning,
                                                                  project: project_ayres_de_canning)

AdminUser.where(email: 'metro19@superadmin.com').first_or_create!(email: 'metro19@superadmin.com',
                                                                  password: 'metroAdmin',
                                                                  is_readonly: false,
                                                                  company: company_metrobuilding,
                                                                  project: project_metro19)

AdminUser.where(email: 'metro19@admin.com').first_or_create!( email: 'metro19@admin.com',
                                                              password: 'sololectura',
                                                              is_readonly: true,
                                                              company: company_metrobuilding,
                                                              project: project_metro19)
puts "Created Admin Users"

