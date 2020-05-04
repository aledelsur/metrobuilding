# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_projects_on_company_id  (company_id)
#
class Project < ApplicationRecord
  belongs_to :company

  validates :company_id, presence: true

  has_many :user_projects
  has_many :users, through: :user_projects

  has_many :budgets
  has_many :properties
  has_many :property_categories
  has_many :newsletters
  has_many :media_assets
  has_many :payments
  has_many :receipts
  has_many :sent_newsletters
end
