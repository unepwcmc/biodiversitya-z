class AddAcronymIdToRefineryTerms < ActiveRecord::Migration
  def change
    add_column :refinery_terms, :acronym_id, :integer
    add_index :refinery_terms, :acronym_id
  end
end
