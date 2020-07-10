class AddMainColorToNewsletters < ActiveRecord::Migration[5.2]
  def change
    add_column :newsletters, :main_color, :string, default: '#1c7363'
  end
end
