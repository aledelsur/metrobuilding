class CreatePaymentProperties < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :property_id, :integer

    create_table :payment_properties do |t|
      t.integer :payment_id
      t.integer :property_id
      t.timestamps
    end
  end
end
