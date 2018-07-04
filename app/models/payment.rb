class Payment < ApplicationRecord
  belongs_to :user

  has_many :payment_properties
  has_many :properties, through: :payment_properties

  has_many :receipts

  validates :value, numericality: true

  accepts_nested_attributes_for :properties

  attr_accessor :receipt_amount

  private

  def create_receipt
    'Create Receipt Here'
  end
end
