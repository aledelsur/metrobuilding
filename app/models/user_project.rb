# == Schema Information
#
# Table name: user_projects
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#  project_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_user_projects_on_company_id  (company_id)
#  index_user_projects_on_project_id  (project_id)
#  index_user_projects_on_user_id     (user_id)
#
class UserProject < ApplicationRecord
  include Concerns::SetCompanyIdFromProject

  belongs_to :company
  belongs_to :user
  belongs_to :project

  validates :project_id, :company_id, presence: true
end
