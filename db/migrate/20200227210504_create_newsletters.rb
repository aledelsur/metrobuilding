class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    begin
      create_table :newsletters do |t|

        t.timestamps
      end
    rescue
    end
  end
end
