class AddDebtToBudget < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :debt, :integer
  end
end
