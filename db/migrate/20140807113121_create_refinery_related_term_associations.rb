class CreateRefineryRelatedTermAssociations < ActiveRecord::Migration

  def change
    create_table :refinery_related_term_associations do |t|
      t.integer :term_id, index: true
      t.integer :related_term_id, index: true

      t.timestamps
    end
  end

end
