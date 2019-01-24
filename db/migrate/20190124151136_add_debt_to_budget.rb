class AddDebtToBudget < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :debt, :integer

    budgets = Budget.all

    budgets.each do |budget|
      users_debt = User.sum { |u| u.debt([budget]) }
      budget.debt = users_debt
      budget.debt = 0 if users_debt < 0
      budget.save
    end
  end
end
