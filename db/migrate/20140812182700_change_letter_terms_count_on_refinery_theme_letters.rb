class ChangeLetterTermsCountOnRefineryThemeLetters < ActiveRecord::Migration
  def up
    change_column :refinery_theme_letters, :letter_terms_count, :integer, null: false, default: 0
  end

  def down
    change_column :refinery_theme_letters, :letter_terms_count, :integer
  end
end
