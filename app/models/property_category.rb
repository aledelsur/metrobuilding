class PropertyCategory < ApplicationRecord
  has_many :properties

  validates :percentage, numericality: true
  validates :percentage, length: { minimum: 0, maximum: 100 }
end
