class Receipt < ApplicationRecord
  belongs_to :payment, optional: true

  validates_presence_of :concept, if: :nil_payment?

  private

  def nil_payment?
    payment_id.nil?
  end
end
