class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.current_project
    @current_project
  end

  def self.current_project=(project)
    @current_project = project
  end
end
