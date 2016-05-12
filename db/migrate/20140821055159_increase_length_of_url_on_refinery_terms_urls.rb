class IncreaseLengthOfUrlOnRefineryTermsUrls < ActiveRecord::Migration
  def up
    change_column :refinery_terms_urls, :title, :string, :limit => 1000
    change_column :refinery_terms_urls, :url, :string, :limit => 1000
  end

  def down
    change_column :refinery_terms_urls, :title, :string, :limit => 255
    change_column :refinery_terms_urls, :url, :string, :limit => 255
  end
end
