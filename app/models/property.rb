class Property < ApplicationRecord
  belongs_to :user
  belongs_to :property_category

  has_many :payment_properties
  has_many :payments, through: :payment_properties

  delegate :percentage, to: :property_category

  def name
    "#{floor_name}#{apartment} - BLOQUE#{section}"
  end

  def formal_name
    "#{floor_name} #{apartment} del bloque #{section}"
  end

  def floor_name
    case floor
    when '0'
      'PB'
    when '1'
      '1ro'
    when '2'
      '2do'
    end
  end

  def debt
    budgets = Budget.all
    total_to_pay = 0
    budgets.each do |budget|
      total_to_pay += budget.value * (percentage / 100)
    end
    total_paid = payments.sum(&:value)
    total_to_pay - total_paid
  end
end
