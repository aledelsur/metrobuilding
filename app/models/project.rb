# == Schema Information
#
# Table name: projects
#
#  id                      :bigint           not null, primary key
#  name                    :string
#  smtp_settings_address   :string           default("smtp.gmail.com")
#  smtp_settings_domain    :string
#  smtp_settings_password  :string
#  smtp_settings_port      :integer          default("587")
#  smtp_settings_user_name :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  company_id              :bigint
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
  has_many :debts

  def smtp_settings
    {
      address:      smtp_settings_address,
      port:         smtp_settings_port,
      domain:       smtp_settings_domain,
      user_name:    smtp_settings_user_name,
      password:     smtp_settings_password,
    }
  end
end
