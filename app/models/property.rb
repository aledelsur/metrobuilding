class Property < ApplicationRecord
  belongs_to :user
  belongs_to :property_category

  delegate :percentage, to: :property_category

  def name
    "#{floor_name}#{apartment} - BLOQUE#{section}"
  end

  def floor_name
    case floor
    when '0'
      'PB'
    when '1'
      '1ro'
    when '2'
      '2do'
    end
  end
end
