class CreatePropertyDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :property_debts do |t|
      t.integer :property_id
      t.integer :debt_id
      t.timestamps
    end

    add_index :property_debts, :property_id
    add_index :property_debts, :debt_id

    drop_table :user_debts
  end
end
