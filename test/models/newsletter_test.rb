# == Schema Information
#
# Table name: newsletters
#
#  id            :bigint           not null, primary key
#  email_content :text
#  sent_at       :datetime
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class NewsletterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
