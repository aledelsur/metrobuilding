class AddDebtToBudget < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :debt, :integer

    budgets = Budget.all.order('id asc')

    users_paid = User.sum { |u| u.paid_in_total }

    budgets.each do |budget|
      budget.debt = budget.value

      budget.debt = budget.debt - users_paid
      if budget.debt < 0
        budget.debt = 0
        users_paid = users_paid - budget.value
      end
      budget.save
    end
  end
end
