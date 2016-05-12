class AddIconIdToRefineryTermsThemes < ActiveRecord::Migration
  def change
    add_column :refinery_terms_themes, :icon_id, :integer
    add_index :refinery_terms_themes, :icon_id
  end
end
