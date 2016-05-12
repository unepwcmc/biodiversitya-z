class AddIsMasterToRefineryTermThemeAssociations < ActiveRecord::Migration
  def change
    add_column :refinery_term_theme_associations, :is_master, :boolean, null: false, default: false
  end
end
