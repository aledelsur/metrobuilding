# == Schema Information
#
# Table name: sent_newsletters
#
#  id                    :bigint           not null, primary key
#  newsletter_variables  :json
#  sent_newsletter_token :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  newsletter_id         :bigint
#  user_id               :bigint
#
# Indexes
#
#  index_sent_newsletters_on_newsletter_id          (newsletter_id)
#  index_sent_newsletters_on_sent_newsletter_token  (sent_newsletter_token)
#  index_sent_newsletters_on_user_id                (user_id)
#

class SentNewsletter < ApplicationRecord
  belongs_to :user
  belongs_to :newsletter

  after_save :generate_token_and_newsletter_url

  private

  def generate_token_and_newsletter_url
    update_column(:sent_newsletter_token, SecureRandom.hex(15)) if sent_newsletter_token.blank?
  end
end
