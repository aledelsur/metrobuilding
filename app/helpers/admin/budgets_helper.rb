module Admin::BudgetsHelper
  def budget_not_active_yet?(budget)
    return true unless budget.start_date

    DateTime.now < budget.start_date
  end

  def calculate_default_budget_start_date(budget)
    unless budget.persisted? # we only want to set the default when creating a Budget. Not when updating.
      last_budget = Budget.last

      if last_budget.present?
        last_budget.due_date
      end
    end
  end
end