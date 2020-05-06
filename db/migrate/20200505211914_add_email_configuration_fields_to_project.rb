class AddEmailConfigurationFieldsToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :smtp_settings_address, :string, default: 'smtp.gmail.com'
    add_column :projects, :smtp_settings_port, :integer, default: 587
    add_column :projects, :smtp_settings_domain, :string
    add_column :projects, :smtp_settings_user_name, :string
    add_column :projects, :smtp_settings_password, :string
  end
end
