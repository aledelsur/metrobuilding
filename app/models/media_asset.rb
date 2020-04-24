# == Schema Information
#
# Table name: media_assets
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class MediaAsset < ApplicationRecord
  belongs_to :newsletter_section, optional: true
  has_and_belongs_to_many :newsletter_sections
  has_one_attached :image

  validate :image_attached?

  def thumbnail
    return image.variant(resize: '120x120!')
  end

  private

  def image_attached?
    errors.add(:image, "debe ser seleccionada") unless image.attached?
  end
end
