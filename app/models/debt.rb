class Debt < ApplicationRecord
  has_many :user_debts
  has_many :users, through: :user_debts

  attr_accessor :user_ids

  after_save :create_user_debts

  accepts_nested_attributes_for :user_debts, allow_destroy: true, reject_if: :all_blank

  validates :amount, presence: true, numericality: true
  validates :description, presence: true

  private

  def create_user_debts
    user_ids.split(',').reject(&:empty?).each do |id|
      user_debts.create(user_id: id)
    end
  end
end
