class AddDollarValueToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :dollar_against_peso_value, :float
    add_column :payments, :dollar_value, :float
    add_column :payments, :payment_type, :integer
    add_column :payments, :check_number, :string
    add_column :budgets, :dollar_against_peso_value, :float
  end
end
