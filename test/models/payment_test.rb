# == Schema Information
#
# Table name: payments
#
#  id                        :bigint           not null, primary key
#  check_number              :string
#  dollar_against_peso_value :float
#  dollar_value              :float
#  payment_type              :integer
#  value                     :float
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  company_id                :bigint
#  project_id                :bigint
#  user_id                   :integer
#
# Indexes
#
#  index_payments_on_user_id  (user_id)
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
