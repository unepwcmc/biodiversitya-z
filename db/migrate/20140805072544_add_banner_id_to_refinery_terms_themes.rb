class AddBannerIdToRefineryTermsThemes < ActiveRecord::Migration
  def change
    add_column :refinery_terms_themes, :banner_id, :integer
  end
end
