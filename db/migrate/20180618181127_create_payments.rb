class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :value
      t.integer :state, default: 1
      t.integer :user_id
      t.datetime :due_date

      t.timestamps
    end
  end
end
