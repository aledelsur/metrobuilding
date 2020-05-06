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
require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
