class AddAcronymToRefineryTerms < ActiveRecord::Migration
  def change
    add_column :refinery_terms, :acronym, :string
  end
end
