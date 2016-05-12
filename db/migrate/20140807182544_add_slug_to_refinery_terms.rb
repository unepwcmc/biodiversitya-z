class AddSlugToRefineryTerms < ActiveRecord::Migration
  def change
    add_column :refinery_terms, :slug, :string
    add_index :refinery_terms, :slug, :unique => true
  end
end
