# == Schema Information
#
# Table name: media_assets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MediaAsset < ApplicationRecord
  belongs_to :newsletter_section, optional: true
  has_and_belongs_to_many :newsletter_sections
  has_one_attached :image

  def thumbnail
    return image.variant(resize: '300x300!')
  end

end
