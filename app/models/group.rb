# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint
#
# Indexes
#
#  index_groups_on_project_id  (project_id)
#
class Group < ApplicationRecord
  belongs_to :project
  
  has_many :user_groups
  has_many :users, through: :user_groups, dependent: :destroy
end
