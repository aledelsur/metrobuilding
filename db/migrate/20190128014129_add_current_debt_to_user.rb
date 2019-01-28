class AddCurrentDebtToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_debt, :integer

    users = User.all
    users.each do |user|
      user.current_debt = user.debt
      user.save
    end
  end
end
