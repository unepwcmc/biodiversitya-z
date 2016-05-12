class CreateTermsThemes < ActiveRecord::Migration

  def up
    create_table :refinery_terms_themes do |t|
      t.string :title
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.timestamps
    end

    add_index :refinery_terms_themes, :rgt
    add_index :refinery_terms_themes, :lft
    add_index :refinery_terms_themes, :parent_id
    add_index :refinery_terms_themes, :depth
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-terms"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/terms/themes"})
    end

    drop_table :refinery_terms_themes

  end

end