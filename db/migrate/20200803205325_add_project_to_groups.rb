class AddProjectToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :project
  end
end
