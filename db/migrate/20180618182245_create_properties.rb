class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :property_category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
