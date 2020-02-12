# == Schema Information
#
# Table name: budgets
#
#  id                        :bigint           not null, primary key
#  debt                      :integer
#  dollar_against_peso_value :float
#  due_date                  :datetime
#  taxable_percentage        :float
#  value                     :float
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Budget < ApplicationRecord
  has_many :payments

  validates :value, numericality: true
  validates :dollar_against_peso_value, numericality: true

  after_create :recalculate_debt

  def recalculate_debt
    current_debts = User.where('current_debt > ?', 0).pluck(:current_debt)
    self.debt = current_debts.sum
    save
  end
end


