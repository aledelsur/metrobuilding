desc "This task is temporary. It creates data in Production for demo purposes"
task :populate_production_db_for_demo => :environment do
  User.destroy_all
  user1 = User.create(email: 'carlosferreira@gmail.com', first_name: 'Carlos', last_name: 'Ferreira', phone_number: '4964-7321', address_1: 'Av. Santa Fe 2847, 10 A', password: '123456789')
  user2 = User.create(email: 'vivianaperez@gmail.com', first_name: 'Viviana', last_name: 'Perez', phone_number: '4627-8172', address_1: 'Av. Del Libertador 4757, PB C', password: '123456789')
  user3 = User.create(email: 'mauriciorivas@gmail.com', first_name: 'Mauricio', last_name: 'Rivas', phone_number: '4625-9382', address_1: 'Av. Federico Lacroze 2453, 14 A', password: '123456789')
  user4 = User.create(email: 'marceladominguez@gmail.com', first_name: 'Marcela', last_name: 'Dominguez', phone_number: '4972-1422', address_1: 'Báez 756, 12 B', password: '123456789')
  puts "4 users created"

  PropertyCategory.destroy_all
  cat1 = PropertyCategory.create(name: 'Monoambiente', percentage: 0.72)
  cat2 = PropertyCategory.create(name: '1 Ambiente', percentage: 0.68)
  cat3 = PropertyCategory.create(name: '2 Ambientes', percentage: 0.51)
  cat4 = PropertyCategory.create(name: '3 Ambientes', percentage: 0.48)
  puts "4 Property Categories created"

  Property.destroy_all
  Property.create(property_category: cat1, user: user1, section: '1', apartment: 'A', floor: '0', rooms: '0')
  Property.create(property_category: cat2, user: user2, section: '2', apartment: 'B', floor: '2', rooms: '1')
  Property.create(property_category: cat3, user: user3, section: '3', apartment: 'C', floor: '5', rooms: '2')
  Property.create(property_category: cat4, user: user4, section: '4', apartment: 'D', floor: '9', rooms: '3')
  puts "4 Properties created"

  Budget.destroy_all
  Budget.create(value: 1000000, dollar_against_peso_value: 66, due_date: DateTime.now + 7.days)
  puts "1 Budget created"  
end