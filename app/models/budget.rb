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


