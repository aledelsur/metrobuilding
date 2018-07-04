class Payment < ApplicationRecord
  enum payment_type: [:deposit, :cash, :check]

  belongs_to :user

  has_many :payment_properties
  has_many :properties, through: :payment_properties

  has_many :receipts

  validates :value, numericality: true
  validates :dollar_against_peso_value, numericality: true

  accepts_nested_attributes_for :properties

  before_save :set_dollar_value

  attr_accessor :receipt_amount

  private

  def set_dollar_value
    self.dollar_value = value / dollar_against_peso_value
  end

  def create_receipt
    'Create Receipt Here'
  end
end
