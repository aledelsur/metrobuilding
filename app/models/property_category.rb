# == Schema Information
#
# Table name: property_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  percentage :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PropertyCategory < ApplicationRecord
  has_many :properties

  validates :percentage, numericality: true
  validates :percentage, length: { minimum: 0, maximum: 100 }
end
