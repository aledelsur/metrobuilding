class AddRemoveFieldsForProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :budget_id, :integer
    remove_column :payments, :due_date, :datetime
    remove_column :payments, :state, :integer

    add_column :payments, :property_id, :integer

    add_column :receipts, :payment_id, :integer
  end
end
