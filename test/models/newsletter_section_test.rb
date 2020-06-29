# == Schema Information
#
# Table name: newsletter_sections
#
#  id            :bigint           not null, primary key
#  description   :text
#  position      :integer
#  template_type :integer          default("0")
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  newsletter_id :integer
#

require 'test_helper'

class NewsletterSectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
