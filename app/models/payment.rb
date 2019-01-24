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
