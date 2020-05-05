class UpdateAttributeSentToNewsletters < ActiveRecord::Migration[5.2]
  def change
    begin
      remove_column :newsletters, :sent
      add_column :newsletters, :sent_at, :datetime
    rescue
    end
  end
end
