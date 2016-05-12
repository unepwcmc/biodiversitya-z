class RemoveLetterIdFromRefineryTerms < ActiveRecord::Migration
  def up
    remove_column :refinery_terms, :letter_id
  end

  def down
    add_column :refinery_terms, :letter_id, :integer
  end
end
