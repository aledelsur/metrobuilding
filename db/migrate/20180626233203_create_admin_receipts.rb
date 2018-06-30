class CreateAdminReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.integer :value
      t.integer :user_id
      t.string :month
      t.string :year
      t.string :unit
      t.timestamps
    end
  end
end
