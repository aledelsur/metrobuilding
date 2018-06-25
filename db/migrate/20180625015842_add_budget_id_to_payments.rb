class AddBudgetIdToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :budget_id, :integer
  end
end
