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

  def budget_debt
    Budget.all.sum do |budget|
      budget.value * (percentage / 100)
    end
  end

  def debt
    budget_debt - total_paid(:pesos)
  end

  def total_paid(currency)
    payments = self.payments.includes(:properties)
    payments.sum do |payment|
      if currency == :peso
        payment.value
      elsif currency == :dollar
        payment.dollar_value
      end
    end.round
  end
end
