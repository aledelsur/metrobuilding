class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_many :properties
  has_many :payments
  has_many :receipts, through: :payments

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # def generate_payment(value, due_date, id)
  #   total_percentage = properties.sum { |property| property.percentage }
  #   amount_to_pay = value * (total_percentage / 100)
  #   payments.create(value: amount_to_pay, due_date: due_date, budget_id: id)
  # end

  def name
    "#{first_name} #{last_name}"
  end

  def phones
    "#{phone_number} \n #{mobile_number}"
  end

  def debt
    budgets = Budget.all
    total_paid = payments.sum { |p| p.value.present? ? p.value : 0 }
    total_to_pay = 0
    budgets.each do |budget|
      total_percentage = properties.sum { |property| property.percentage }
      total_to_pay += budget.value * (total_percentage / 100)
    end
    total_to_pay - total_paid
  end
end
