class User < ApplicationRecord
  has_many :properties
  has_many :payments

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def generate_payment(value, due_date, id)
    total_percentage = properties.sum { |property| property.percentage }
    amount_to_pay = value * (total_percentage / 100)
    payments.create(value: amount_to_pay, due_date: due_date, budget_id: id)
  end
end
