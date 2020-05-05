class AddRatesToBudgets < ActiveRecord::Migration[5.2]
  def change
    begin
      add_column :budgets, :rate_1, :float, default: 1
      add_column :budgets, :rate_2, :float, default: 1
    rescue
    end
  end
end
