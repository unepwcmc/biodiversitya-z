class AddTaglineAndDescriptionToRefineryTermsThemes < ActiveRecord::Migration
  def change
    add_column :refinery_terms_themes, :tagline, :string
    add_column :refinery_terms_themes, :description, :text
  end
end
