# == Schema Information
#
# Table name: budgets
#
#  id                        :bigint           not null, primary key
#  debt                      :integer
#  dollar_against_peso_value :float
#  due_date                  :datetime
#  rate_1                    :float            default("1.0")
#  rate_2                    :float            default("1.0")
#  start_date                :datetime
#  taxable_percentage        :float
#  value                     :float
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  company_id                :bigint
#  project_id                :bigint
#

class Budget < ApplicationRecord
  include Concerns::SetCompanyIdFromProject

  has_many :payments
  belongs_to :project
  belongs_to :company

  validates :value, numericality: true
  validates :dollar_against_peso_value, numericality: true, if: :payments_activated?

  validates :project_id, :company_id, presence: true

  scope :active, -> { where('start_date IS NULL OR start_date > ?', DateTime.now) }
  scope :current, -> { where("start_date <= ? AND due_date > ?", DateTime.now, DateTime.now ) }

  after_create :recalculate_debt

  def recalculate_debt
    current_debts = User.where('current_debt > ?', 0).pluck(:current_debt)
    self.debt = current_debts.sum
    save
  end

  # [A * (C / B ) * D]
  def calculate_due_amount(percentage)
    value * (rate_2 / rate_1) * (percentage / 100)
  end

  # def self.current
  #   where("start_date <= ? AND due_date > ?", DateTime.now, DateTime.now ).last
  # end

  private

  def payments_activated?
    @company.has_feature?(:payments)
  end
end


