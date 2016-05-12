class IncreaseLengthOfRefineryUrlsDescription < ActiveRecord::Migration
  def up
    change_column :refinery_terms_urls, :description, :string, :limit => 1000
  end

  def down
    change_column :refinery_terms_urls, :description, :string, :limit => 255
  end
end