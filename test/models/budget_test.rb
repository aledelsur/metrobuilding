# == Schema Information
#
# Table name: budgets
#
#  id                        :bigint           not null, primary key
#  debt                      :integer
#  dollar_against_peso_value :float
#  due_date                  :datetime
#  rate_1                    :float            default("1.0")
#  rate_2                    :float            default("1.0")
#  start_date                :datetime
#  taxable_percentage        :float
#  value                     :float
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
