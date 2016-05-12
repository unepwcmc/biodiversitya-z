class CreateRefineryTermsUrls < ActiveRecord::Migration
  def change
    create_table :refinery_terms_urls do |t|
      t.string :title
      t.string :url
      t.integer :position
      t.string :type

      t.timestamps
    end
    add_index :refinery_terms_urls, :position
  end
end