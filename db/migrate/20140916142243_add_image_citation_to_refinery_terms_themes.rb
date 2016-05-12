class AddImageCitationToRefineryTermsThemes < ActiveRecord::Migration
  def change
    add_column :refinery_terms_themes, :image_citation, :string
  end
end
