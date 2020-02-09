class CreateDebts < ActiveRecord::Migration[5.2]
  def change
    create_table :debts do |t|
      t.text :description
      t.integer :amount
      t.integer :currency
      t.datetime :due_date
      t.timestamps
    end
  end
end
