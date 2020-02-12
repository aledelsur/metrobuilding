# == Schema Information
#
# Table name: property_debts
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  debt_id     :integer
#  property_id :integer
#
# Indexes
#
#  index_property_debts_on_debt_id      (debt_id)
#  index_property_debts_on_property_id  (property_id)
#

class PropertyDebt < ApplicationRecord
  belongs_to :property
  belongs_to :debt
end
