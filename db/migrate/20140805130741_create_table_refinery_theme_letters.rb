class CreateTableRefineryThemeLetters < ActiveRecord::Migration

  def change
    create_table :refinery_theme_letters do |t|
      t.string :letter
      t.integer :terms_count, null: false, default: 0
      t.integer :theme_id, index: true

      t.timestamps
    end
  end

end