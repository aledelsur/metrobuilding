# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless PropertyCategory.any?
  PropertyCategory.create(percentage: 0.72, name: 'Grande Adentro')
  PropertyCategory.create(percentage: 0.68, name: 'Grande Afuera')
  PropertyCategory.create(percentage: 0.51, name: 'Chico Adentro')
  PropertyCategory.create(percentage: 0.48, name: 'Chico Afuera')
end

require 'import_csv'

ImportCSV.new(Rails.root.to_s + '/lib/propietarios.csv')