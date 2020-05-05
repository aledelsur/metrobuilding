class CreateMediaAssetsNewsletterSections < ActiveRecord::Migration[5.2]
  def change
    begin
      create_table :media_assets_newsletter_sections do |t|
        t.belongs_to :media_asset
        t.belongs_to :newsletter_section
      end
    rescue
    end
  end
end
