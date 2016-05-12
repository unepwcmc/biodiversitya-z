class AddLegacyIdAndLegacyTypeToRefineryTerms < ActiveRecord::Migration
  def change
    add_column :refinery_terms, :legacy_id, :integer
    add_index :refinery_terms, :legacy_id
    add_column :refinery_terms, :legacy_type, :integer
    add_index :refinery_terms, :legacy_type
  end
end
