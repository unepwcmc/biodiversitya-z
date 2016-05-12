class AddDescriptionToRefineryTermsUrls < ActiveRecord::Migration
  def change
    add_column :refinery_terms_urls, :description, :string
  end
end
