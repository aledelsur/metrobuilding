# == Schema Information
#
# Table name: payments
#
#  id                        :bigint           not null, primary key
#  check_number              :string
#  dollar_against_peso_value :float
#  dollar_value              :float
#  payment_type              :integer
#  value                     :float
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  company_id                :bigint
#  project_id                :bigint
#  user_id                   :integer
#
# Indexes
#
#  index_payments_on_user_id  (user_id)
#

class Payment < ApplicationRecord
  include Concerns::SetCompanyIdFromProject

  enum payment_type: [:cuota, :deuda_dolares, :deuda_pesos]

  validates :properties, presence: { message: 'Debe seleccionar al menos una propiedad' }
  validates :project_id, :company_id, presence: true

  belongs_to :user
  belongs_to :project
  belongs_to :company

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
    user.current_debt = user.debt
    user.save
  end
end
