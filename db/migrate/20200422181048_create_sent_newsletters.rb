class CreateSentNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :sent_newsletters do |t|
      t.string :investor_name
      t.integer :current_debt
      t.string :sent_newsletters, index: true
      t.belongs_to :user
      t.belongs_to :newsletter

      t.timestamps
    end
  end
end
