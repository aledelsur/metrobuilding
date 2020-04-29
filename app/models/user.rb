# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address_1              :string
#  address_2              :string
#  cuit                   :string
#  current_debt           :integer
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  dni                    :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  mobile_number          :string
#  notes                  :text
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default("0"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_many :properties
  has_many :payments
  has_many :receipts, through: :payments
  has_many :sent_newsletters

  has_many :debts, through: :properties

  after_update :recalculate_budget_debt

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # def generate_payment(value, due_date, id)
  #   total_percentage = properties.sum { |property| property.percentage }
  #   amount_to_pay = value * (total_percentage / 100)
  #   payments.create(value: amount_to_pay, due_date: due_date, budget_id: id)
  # end

  def name
    "#{last_name}, #{first_name}"
  end

  def friendly_name
    "#{first_name} #{last_name}"
  end

  def phones
    "#{phone_number} \n #{mobile_number}"
  end

  def debt(budgets = nil)
    budgets = Budget.all if budgets.nil?
    total_to_pay = 0
    budgets.each do |budget|
      total_percentage = properties.sum { |property| property.percentage }
      total_to_pay += budget.calculate_due_amount(total_percentage)  # [A * (rate_2/rate_1) * D]
    end
    total_to_pay - paid_in_total
  end

  def special_debt(currency)
    payment_type = (currency == :pesos ? "deuda_pesos" : "deuda_dolares")
    initial_amount = debts.select { |debt| debt.currency.to_sym == currency.to_sym }.map(&:amount).sum
    initial_amount - self.payments.where(payment_type: payment_type).map(&:value).sum.round
  end

  def paid_in_total
    payments.cuota.sum { |p| p.value.present? ? p.value : 0 }
  end

  def recalculate_budget_debt
    if saved_change_to_current_debt?
      budget = Budget.last
      budget.recalculate_debt
    end
  end

  def self.to_csv
    attributes = %w{id email name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

end
