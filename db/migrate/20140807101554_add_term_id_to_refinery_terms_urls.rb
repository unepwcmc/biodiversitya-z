class AddTermIdToRefineryTermsUrls < ActiveRecord::Migration
  def change
    add_column :refinery_terms_urls, :term_id, :integer
    add_index :refinery_terms_urls, :term_id
  end
end
