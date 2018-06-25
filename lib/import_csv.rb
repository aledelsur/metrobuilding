require 'csv'

class ImportCSV
  def initialize(path)
    CSV.foreach(path) do |row|
      apartment = row.first
      next if apartment == 'apartment'
      percentage = row[1].split('%').first.to_f
      rooms = row[2]
      floor_1_owner = row[3]
      floor_2_owner = row[4]
      floor_3_owner = row[5]
      section = row[6]
      [floor_1_owner, floor_2_owner, floor_3_owner].each.with_index do |owner, index|
        user = User.where(first_name: owner).first
        if user.nil?
          email = "email-#{owner.downcase.gsub(' ', '-').gsub(',', '')}@example.com"
          user = User.create!(first_name: owner, email: email, password: '12341234', password_confirmation: '12341234')
        end

        property_category = PropertyCategory.find_by(percentage: percentage)
        Property.create!(apartment: apartment, rooms: rooms, floor: index, section: section, user_id: user.id,
                         property_category_id: property_category.id)
        puts '.'
      end
    end
  end
end