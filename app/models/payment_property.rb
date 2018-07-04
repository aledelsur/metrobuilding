class PaymentProperty < ApplicationRecord
  belongs_to :payment
  belongs_to :property
end
