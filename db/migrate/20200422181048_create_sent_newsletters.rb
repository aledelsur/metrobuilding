class CreateSentNewsletters < ActiveRecord::Migration[5.2]
  def change
    begin
      create_table :sent_newsletters do |t|
        t.string :sent_newsletter_token, index: true
        t.belongs_to :user
        t.belongs_to :newsletter

        t.timestamps
      end
    rescue
    end
  end
end
