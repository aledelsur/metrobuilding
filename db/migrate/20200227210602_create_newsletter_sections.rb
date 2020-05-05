class CreateNewsletterSections < ActiveRecord::Migration[5.2]
  def change
    begin
      create_table :newsletter_sections do |t|
        t.integer :newsletter_id
        t.string :title
        t.text :description
        t.integer :position
        t.timestamps
      end
    rescue
    end
  end
end
