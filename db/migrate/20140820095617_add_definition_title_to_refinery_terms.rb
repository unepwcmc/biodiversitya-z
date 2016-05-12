class AddDefinitionTitleToRefineryTerms < ActiveRecord::Migration
  def change
    add_column :refinery_terms, :definition_title, :string
  end
end
