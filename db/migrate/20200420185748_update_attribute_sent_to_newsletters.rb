class UpdateAttributeSentToNewsletters < ActiveRecord::Migration[5.2]
  def change
    remove_column :newsletters, :sent
    add_column :newsletters, :sent_at, :datetime
  end
end
