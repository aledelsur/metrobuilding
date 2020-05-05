class AddTitleToNewsletters < ActiveRecord::Migration[5.2]
  def change
    add_column :newsletters, :title, :string rescue nil
  end
end
