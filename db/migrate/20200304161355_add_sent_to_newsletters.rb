class AddSentToNewsletters < ActiveRecord::Migration[5.2]
  def change
    add_column :newsletters, :sent, :boolean, default:false rescue nil
  end
end
