# == Schema Information
#
# Table name: property_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  percentage :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#  project_id :bigint
#

class PropertyCategory < ApplicationRecord
  include Concerns::SetCompanyIdFromProject

  has_many :properties

  validates :percentage, numericality: true
  validates :percentage, length: { minimum: 0, maximum: 100 }

  validates :project_id, :company_id, presence: true

  belongs_to :project
  belongs_to :company
end
