# == Schema Information
#
# Table name: payment_properties
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  payment_id  :integer
#  property_id :integer
#
# Indexes
#
#  index_payment_properties_on_payment_id   (payment_id)
#  index_payment_properties_on_property_id  (property_id)
#

class PaymentProperty < ApplicationRecord
  belongs_to :payment
  belongs_to :property
end
