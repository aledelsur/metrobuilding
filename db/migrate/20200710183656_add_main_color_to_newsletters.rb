class AddMainColorToNewsletters < ActiveRecord::Migration[5.2]
  def change
    add_column :newsletters, :main_color, :string, default: '#00c9fc'
  end
end
