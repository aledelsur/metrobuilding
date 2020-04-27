class AddStartDateToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :start_date, :datetime
  end
end
