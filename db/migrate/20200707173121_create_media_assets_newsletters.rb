class CreateMediaAssetsNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :media_assets_newsletters do |t|
      t.belongs_to :newsletter
      t.belongs_to :media_asset

      t.timestamps
    end
  end
end
