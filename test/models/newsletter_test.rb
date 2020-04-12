# == Schema Information
#
# Table name: newsletters
#
#  id         :bigint           not null, primary key
#  sent       :boolean          default("false")
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class NewsletterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
