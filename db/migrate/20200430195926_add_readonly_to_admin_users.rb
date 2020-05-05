class AddReadonlyToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    # add_column :admin_users, :is_readonly, :boolean, default: false
  end
end
