class CreateUserDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :user_debts do |t|
      t.integer :user_id
      t.integer :debt_id
      t.timestamps
    end

    add_index :user_debts, :user_id
    add_index :user_debts, :debt_id

    add_index :payment_properties, :payment_id
    add_index :payment_properties, :property_id

    add_index :payments, :user_id
  end
end
