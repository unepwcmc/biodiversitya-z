class AddLetterIdToRefineryTerms < ActiveRecord::Migration
  def change
    add_column :refinery_terms, :letter_id, :integer
    add_index :refinery_terms, :letter_id
  end
end
