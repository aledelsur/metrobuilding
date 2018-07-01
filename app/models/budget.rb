class Budget < ApplicationRecord
  has_many :payments

  validates_numericality_of :taxable_percentage, greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0

end


