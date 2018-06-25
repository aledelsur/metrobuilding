class Payment < ApplicationRecord
  enum state: { pending: 1, paid: 2, expired: 3 }

  belongs_to :user
  belongs_to :budget

  validates :value, numericality: true
end
