require 'active_support/concern'

module Concerns::SetCompanyIdFromProject
  extend ActiveSupport::Concern

  included do
    before_validation :set_company_id
  end

  def set_company_id
    self.company_id = project.company_id
  end
end