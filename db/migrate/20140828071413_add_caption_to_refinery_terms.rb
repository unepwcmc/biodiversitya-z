class AddCaptionToRefineryTerms < ActiveRecord::Migration
  def change
    add_column :refinery_terms, :caption, :string
  end
end
