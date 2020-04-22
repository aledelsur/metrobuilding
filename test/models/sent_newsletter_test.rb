# == Schema Information
#
# Table name: sent_newsletters
#
#  id            :bigint           not null, primary key
#  current_debt  :integer
#  guid          :string
#  investor_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  newsletter_id :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_sent_newsletters_on_newsletter_id  (newsletter_id)
#  index_sent_newsletters_on_user_id        (user_id)
#
require 'test_helper'

class SentNewsletterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
