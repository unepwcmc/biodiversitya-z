class CreateTableRefineryLetterTerms < ActiveRecord::Migration

  def change
    create_table :refinery_letter_terms do |t|
      t.integer :letter_id, index: true
      t.integer :term_id, index: true
    end
  end

end
