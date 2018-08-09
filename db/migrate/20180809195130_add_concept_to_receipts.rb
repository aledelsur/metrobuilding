class AddConceptToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :concept, :string
  end
end
