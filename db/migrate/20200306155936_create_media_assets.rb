class CreateMediaAssets < ActiveRecord::Migration[5.2]
  def change
    begin
      create_table :media_assets do |t|

        t.timestamps
      end
    rescue
    end
  end
end
