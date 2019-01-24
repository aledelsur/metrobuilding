class Payment < ApplicationRecord
  enum payment_type: [:deposit, :cash, :check]

  validates :properties, presence: { message: 'Debe seleccionar al menos una propiedad' }

  belongs_to :user

  has_many :payment_properties
  has_many :properties, through: :payment_properties

  has_many :receipts

  validates :value, numericality: { message: 'Debe ser un numero' }
  validates :dollar_against_peso_value, numericality: { message: 'Debe ser un numero' }

  accepts_nested_attributes_for :properties

  before_save :set_dollar_value

  attr_accessor :receipt_amount

  after_create  :recalculate_budget_debt
  after_destroy :recalculate_budget_debt


  private

  def split_value(budget)
    self.value = (value * (budget / value))
    save
  end

  def set_dollar_value
    self.dollar_value = value / dollar_against_peso_value
  end

  def recalculate_budget_debt
    budgets = Budget.where('debt > ?', 0).all
    budgets.each do |budget|
      users_debt = User.sum { |u| u.debt([budget]) }
      budget.debt = users_debt
      budget.debt = 0 if users_debt < 0
      budget.save
    end
  end
end
