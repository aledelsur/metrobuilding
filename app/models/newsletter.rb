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
#  company_id    :bigint
#  project_id    :bigint
#

class Newsletter < ApplicationRecord
  include Concerns::SetCompanyIdFromProject

  has_many :newsletter_sections, dependent: :destroy

  accepts_nested_attributes_for :newsletter_sections

  validates :title, presence: true, on: :update
  validates :project_id, :company_id, presence: true

  after_create :set_email_content

  belongs_to :project
  belongs_to :company

  private

  def set_email_content
    update_attribute(:email_content, 'Estimado {{NOMBRE_INVERSOR}}, <br><br> Le enviamos los avances de la obra. Puede acceder a verlos entrando a este link {{NEWSLETTER_URL}}. <br><br> Saludos, <br>Metrobuilding.')
  end
end
