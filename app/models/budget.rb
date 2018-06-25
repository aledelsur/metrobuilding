class Budget < ApplicationRecord

  after_create :create_payments

  private

  def create_payments
    users = User.all
    users.each { |u| u.generate_payment(value, due_date, id) }
  end
end
