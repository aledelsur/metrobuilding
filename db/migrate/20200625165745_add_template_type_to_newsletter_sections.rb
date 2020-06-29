class AddTemplateTypeToNewsletterSections < ActiveRecord::Migration[5.2]
  def change
    add_column :newsletter_sections, :template_type, :integer, default: 0
  end
end
