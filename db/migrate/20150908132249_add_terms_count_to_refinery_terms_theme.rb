class AddTermsCountToRefineryTermsTheme < ActiveRecord::Migration
  def change
    add_column :refinery_terms_themes, :terms_count, :integer
  end
end
