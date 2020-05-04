# == Schema Information
#
# Table name: budgets
#
#  id                        :bigint           not null, primary key
#  debt                      :integer
#  dollar_against_peso_value :float
#  due_date                  :datetime
#  rate_1                    :float            default("1.0")
#  rate_2                    :float            default("1.0")
#  start_date                :datetime
#  taxable_percentage        :float
#  value                     :float
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Budget < ApplicationRecord
  has_many :payments

  validates :value, numericality: true
  validates :dollar_against_peso_value, numericality: true, if: :payments_activated?

  after_create :recalculate_debt

  def recalculate_debt
    current_debts = User.where('current_debt > ?', 0).pluck(:current_debt)
    self.debt = current_debts.sum
    save
  end

  # [A * (C / B ) * D]
  def calculate_due_amount(percentage)
    value * (rate_2 / rate_1) * (percentage / 100)
  end

  def self.current
    where("start_date <= ? AND due_date > ?", DateTime.now, DateTime.now ).last
  end

  private

  def payments_activated?
    configatron.features.payments
  end
end


