class FixMess < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :start_date, :datetime
    add_column :newsletters, :email_content, :text
    add_column :budgets, :rate_1, :float, default: 1
    add_column :budgets, :rate_2, :float, default: 1
    add_column :admin_users, :is_readonly, :boolean, default: false
  end
end
