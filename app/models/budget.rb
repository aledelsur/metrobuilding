class Budget < ApplicationRecord
  has_many :payments, dependent: :destroy
  after_create :create_payments
  
  validates_numericality_of :taxable_percentage, :greater_than_or_equal_to => 0.0, :less_than_or_equal_to => 100.0

  private

  def create_payments
    users = User.all
    users.each { |u| u.generate_payment(value, due_date, id) }
  end
end


