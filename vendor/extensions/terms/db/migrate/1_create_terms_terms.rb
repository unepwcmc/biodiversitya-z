class CreateTermsTerms < ActiveRecord::Migration

  def up
    create_table :refinery_terms do |t|
      t.string :title
      t.text :definition
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-terms"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/terms/terms"})
    end

    drop_table :refinery_terms

  end

end
