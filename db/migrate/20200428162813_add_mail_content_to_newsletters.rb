class AddMailContentToNewsletters < ActiveRecord::Migration[5.2]
  def change
    add_column :newsletters, :email_content, :text rescue nil
  end
end
