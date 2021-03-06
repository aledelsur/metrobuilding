desc "This task is temporary. It creates data in Production for demo purposes"
task :populate_db_with_fake_data => :environment do
  raise "RAILS_ENV is not development. This task can only be run in development environment." unless Rails.env.development?

  company = Company.find_by(name: 'metrobuilding')
  project = Project.find_by(name: 'metro19')

  User.destroy_all
  user1 = company.users.create(email: 'example1@example.com', first_name: 'Carlos', last_name: 'Ferreira', phone_number: '4964-7321', address_1: 'Av. Santa Fe 2847, 10 A', password: '123456789')
  project.users << user1

  user2 = company.users.create(email: 'example2@example.com', first_name: 'Viviana', last_name: 'Perez', phone_number: '4627-8172', address_1: 'Av. Del Libertador 4757, PB C', password: '123456789')
  project.users << user2

  user3 = company.users.create(email: 'example3@example.com', first_name: 'Mauricio', last_name: 'Rivas', phone_number: '4625-9382', address_1: 'Av. Federico Lacroze 2453, 14 A', password: '123456789')
  project.users << user3
  
  user4 = company.users.create(email: 'example4@example.com', first_name: 'Marcela', last_name: 'Dominguez', phone_number: '4972-1422', address_1: 'Báez 756, 12 B', password: '123456789')
  project.users << user4
  puts "4 users created"

  PropertyCategory.destroy_all
  cat1 = PropertyCategory.create(name: 'Monoambiente', percentage: 0.72, company_id: company.id, project_id: project.id)
  cat2 = PropertyCategory.create(name: '1 Ambiente', percentage: 0.68, company_id: company.id, project_id: project.id)
  cat3 = PropertyCategory.create(name: '2 Ambientes', percentage: 0.51, company_id: company.id, project_id: project.id)
  cat4 = PropertyCategory.create(name: '3 Ambientes', percentage: 0.48, company_id: company.id, project_id: project.id)
  puts "4 Property Categories created"

  Property.destroy_all
  Property.create(property_category: cat1, user: user1, section: '1', apartment: 'A', floor: '0', rooms: '0', company_id: company.id, project_id: project.id)
  Property.create(property_category: cat2, user: user2, section: '2', apartment: 'B', floor: '2', rooms: '1', company_id: company.id, project_id: project.id)
  Property.create(property_category: cat3, user: user3, section: '3', apartment: 'C', floor: '5', rooms: '2', company_id: company.id, project_id: project.id)
  Property.create(property_category: cat4, user: user4, section: '4', apartment: 'D', floor: '9', rooms: '3', company_id: company.id, project_id: project.id)
  puts "4 Properties created"

  Budget.destroy_all
  Budget.create(value: 1000000, dollar_against_peso_value: 66, start_date: DateTime.now, due_date: DateTime.now + 7.days, rate_1: 101.5632, rate_2: 252.12836, company_id: company.id, project_id: project.id)

  puts "1 Budget created"

  Newsletter.destroy_all
  news1 = Newsletter.create(title: 'CIRCULAR INFORMATIVA Nº 3 | MARZO 2020', company_id: company.id, project_id: project.id)
  news1.newsletter_sections.create(title: 'AVANCE DE TAREAS',position: 1, description: 'Hola {{NOMBRE_INVERSOR}}, Con <b><u>bases</b></u>, <b><u>tabiques submurales</b></u> y <b><u>losa sobre subsuelo ya terminados</b></u>, podemos decir que la obra “salió Del Pozo”, superando de esta manera, la etapa más complicada del proceso, cuyo avance se ve afectado directamente por los días de lluvia.<br><br>Como se puede apreciar en la imagen, el edificio <b><u>ha comenzado a emerger</u></b> con el armado de la losa sobre la Planta Baja sobre la línea de edificación, por lo que ya se hace <b><u>visible desde la calle</u></b>.<br>A continuación, el avance de las tareas.<br><br><ul><li>Losa sobre subsuelo hormigonada al 100%</li><li>Losa sobre planta Baja hormigonada al 60%</li><li>Encofrado de losa sobre Planta Baja sector frente, en ejecución.</li><li>Escalera de planta Baja a 1º  Piso, hormigonada al 100%.<li>Rampa de acceso a Subsuelo, en ejecución.</li></ul>')
  news1.newsletter_sections.create(title: 'HIGIENE Y SEGURIDAD',position: 2, description: '<ul><li>Se cumple con la normativa vigente en materia de Higiene y Seguridad.</li><li>La vereda permanece en buenas condiciones de transitabilidad.</li><li>Se aplica en forma permanente seguimiento sobre el Contratista Principal, para adecuar situaciones de desvíos o incumplimientos.</li><ul>')
  news1.newsletter_sections.create(title: 'GALERIA DE IMÁGENES',position: 3, description: '')

  news2 = Newsletter.create(title: 'CIRCULAR INFORMATIVA Nº 4 | ABRIL 2020', company_id: company.id, project_id: project.id)
  news2.newsletter_sections.create(title: 'AVANCE DE TAREAS',position: 1, description: 'Hola {{NOMBRE_INVERSOR}}, Con <b><u>bases</b></u>, <b><u>tabiques submurales</b></u> y <b><u>losa sobre subsuelo ya terminados</b></u>, podemos decir que la obra “salió Del Pozo”, superando de esta manera, la etapa más complicada del proceso, cuyo avance se ve afectado directamente por los días de lluvia.<br><br>Como se puede apreciar en la imagen, el edificio <b><u>ha comenzado a emerger</u></b> con el armado de la losa sobre la Planta Baja sobre la línea de edificación, por lo que ya se hace <b><u>visible desde la calle</u></b>.<br>A continuación, el avance de las tareas.<br><br><ul><li>Losa sobre subsuelo hormigonada al 100%</li><li>Losa sobre planta Baja hormigonada al 60%</li><li>Encofrado de losa sobre Planta Baja sector frente, en ejecución.</li><li>Escalera de planta Baja a 1º  Piso, hormigonada al 100%.<li>Rampa de acceso a Subsuelo, en ejecución.</li></ul>')
  news2.newsletter_sections.create(title: 'HIGIENE Y SEGURIDAD',position: 2, description: '<ul><li>Se cumple con la normativa vigente en materia de Higiene y Seguridad.</li><li>La vereda permanece en buenas condiciones de transitabilidad.</li><li>Se aplica en forma permanente seguimiento sobre el Contratista Principal, para adecuar situaciones de desvíos o incumplimientos.</li><ul>')
  news2.newsletter_sections.create(title: 'GALERIA DE IMÁGENES',position: 3, description: '')
  puts "2 Newsletters created"
end