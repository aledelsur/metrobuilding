# == Schema Information
#
# Table name: budgets
#
#  id                        :bigint           not null, primary key
#  debt                      :integer
#  dollar_against_peso_value :float
#  due_date                  :datetime
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
