class Property < ApplicationRecord
  belongs_to :user
  belongs_to :property_category

  delegate :percentage, to: :property_category
end
