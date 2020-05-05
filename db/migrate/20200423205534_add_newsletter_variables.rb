class AddNewsletterVariables < ActiveRecord::Migration[5.2]
  def change
    add_column :sent_newsletters, :newsletter_variables, :json, default: {} rescue nil
  end
end
