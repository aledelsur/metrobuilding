class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.float :value
      t.float :taxable_percentage
      t.datetime :due_date
      t.timestamps
    end
  end
end
