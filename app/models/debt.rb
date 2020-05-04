# == Schema Information
#
# Table name: debts
#
#  id          :bigint           not null, primary key
#  amount      :integer
#  currency    :integer
#  description :text
#  due_date    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint
#  project_id  :bigint
#

class Debt < ApplicationRecord
  include Concerns::SetCompanyIdFromProject

  has_many :property_debts
  has_many :properties, through: :property_debts

  belongs_to :project
  belongs_to :company

  validates :project_id, :company_id, presence: true

  enum currency: ['pesos', 'dolares']

  attr_accessor :property_ids

  after_save :create_property_debts

  validates :amount, presence: true, numericality: true
  validates :description, presence: true

  private

  def create_property_debts
    property_ids.split(',').reject(&:empty?).each do |id|
      property_debts.create(property_id: id)
    end
  end
end
