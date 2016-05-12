class CreateTableRefineryTermsThemes < ActiveRecord::Migration
  def change
    create_table :refinery_term_theme_associations do |t|
      t.integer :term_id, index: true
      t.integer :theme_id, index: true

      t.timestamps
    end
  end
end

#TODO: Should we have used individual indexes here?  Or set an index composite index across both columns?