class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :property

  has_many :receipts

  validates :value, numericality: true

  attr_accessor :receipt_amount

  private

  def create_receipt
    'Create Receipt Here'
  end
end
