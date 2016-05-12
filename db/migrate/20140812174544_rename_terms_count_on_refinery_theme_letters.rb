class RenameTermsCountOnRefineryThemeLetters < ActiveRecord::Migration

  def change
    rename_column :refinery_theme_letters, :terms_count, :letter_terms_count
  end

end
