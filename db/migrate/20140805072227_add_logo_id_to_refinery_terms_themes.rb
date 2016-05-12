class AddLogoIdToRefineryTermsThemes < ActiveRecord::Migration
  def change
    add_column :refinery_terms_themes, :logo_id, :integer
  end
end
