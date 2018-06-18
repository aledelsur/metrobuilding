class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :dni
      t.string :email
      t.string :cuit
      t.string :phone_number
      t.string :mobile_number
      t.string :address_1
      t.string :address_2

      t.timestamps
    end
  end
end
