class CreatePropertyCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :property_categories do |t|
      t.string :name
      t.float :percentage

      t.timestamps
    end
  end
end
