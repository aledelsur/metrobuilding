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
class SentNewsletter < ApplicationRecord
  belongs_to :user
  belongs_to :newsletter

  after_save :generate_guid_and_newsletter_url

  has_shortened_urls

  def newsletter_url
    shortened_url = shortened_urls.last
    if shortened_url.present?
      "#{configatron.app_url}\/newsletter\/#{shortened_url.unique_key}"
    end
  end

  private

  def generate_guid_and_newsletter_url
    unless guid.present?
      update_column(:guid, SecureRandom.hex(15))
      url = "/admin/newsletters/#{newsletter.id}?guid=#{guid}"
      shortened_url = Shortener::ShortenedUrl.generate(url, owner: self)
    end
  end
end
