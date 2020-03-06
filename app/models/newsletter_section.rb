# == Schema Information
#
# Table name: newsletter_sections
#
#  id            :bigint           not null, primary key
#  description   :text
#  position      :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  newsletter_id :integer
#

class NewsletterSection < ApplicationRecord
  belongs_to :newsletter
  has_many :media_assets

  default_scope { order(position: :asc) }

  validates :title,
            presence: true
end
