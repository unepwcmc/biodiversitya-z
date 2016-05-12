class AddSlugToRefineryTermsThemes < ActiveRecord::Migration
  def change
    add_column :refinery_terms_themes, :slug, :string
    add_index :refinery_terms_themes, :slug, :unique => true
  end
end
