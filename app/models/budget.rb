class Budget < ApplicationRecord
  has_many :payments

  validates :value, numericality: true
  validates :dollar_against_peso_value, numericality: true

end


