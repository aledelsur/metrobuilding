class CreateMediaAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :media_assets do |t|

      t.timestamps
    end
  end
end
