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
#  company_id :bigint
#  payment_id :integer
#  project_id :bigint
#

class Receipt < ApplicationRecord
  include Concerns::SetCompanyIdFromProject

  belongs_to :payment, optional: true

  belongs_to :project
  belongs_to :company

  validates_presence_of :concept, if: :nil_payment?
  validates :project_id, :company_id, presence: true

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
