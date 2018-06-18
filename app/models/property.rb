class Property < ApplicationRecord
  belongs_to :user
  belongs_to :property_category

  validates :user_id, presence: true
  validates :property_category_id, presence: true
end
