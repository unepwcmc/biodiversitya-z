class CreateRefineryTermsSections < ActiveRecord::Migration

  def change
    create_table :refinery_terms_sections do |t|
      t.string :title
      t.text :body
      t.integer :position, index: true
      t.integer :term_id, index: true

      t.timestamps
    end
  end

end