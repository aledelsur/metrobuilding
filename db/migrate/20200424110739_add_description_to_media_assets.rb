class AddDescriptionToMediaAssets < ActiveRecord::Migration[5.2]
  def change
    add_column :media_assets, :description, :string rescue nil
  end
end
