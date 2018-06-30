class AddRemoveReciptFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :receipts, :unit, :string
    remove_column :receipts, :user_id, :integer
    add_column :receipts, :name, :string
  end
end
