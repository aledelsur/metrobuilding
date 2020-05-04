# == Schema Information
#
# Table name: media_assets
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint
#  project_id  :bigint
#
class MediaAsset < ApplicationRecord
  include Concerns::SetCompanyIdFromProject

  belongs_to :newsletter_section, optional: true
  has_and_belongs_to_many :newsletter_sections
  has_one_attached :image

  belongs_to :company
  belongs_to :project

  validates :project_id, :company_id, presence: true

  validate :image_attached?

  def thumbnail
    return image.variant(resize: '120x120!') if image.attached?
  end

  private

  def image_attached?
    errors.add(:image, "debe ser seleccionada") unless image.attached?
  end
end
