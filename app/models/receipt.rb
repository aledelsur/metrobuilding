# == Schema Information
#
# Table name: receipts
#
#  id         :bigint           not null, primary key
#  concept    :string
#  month      :string
#  name       :string
#  value      :integer
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  payment_id :integer
#

class Receipt < ApplicationRecord
  belongs_to :payment, optional: true

  validates_presence_of :concept, if: :nil_payment?

  def formatted_created_at_date
    created_at.strftime("%d/%m/%Y")
  end

  def receipt_month
    month.capitalize
  end

  private

  def nil_payment?
    payment_id.nil?
  end
end
