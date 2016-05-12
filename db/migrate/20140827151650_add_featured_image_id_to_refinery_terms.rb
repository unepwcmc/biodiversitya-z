class AddFeaturedImageIdToRefineryTerms < ActiveRecord::Migration
  def change
    add_column :refinery_terms, :featured_image_id, :integer
    add_index :refinery_terms, :featured_image_id
  end
end
