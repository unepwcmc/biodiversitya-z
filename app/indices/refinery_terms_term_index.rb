ThinkingSphinx::Index.define 'refinery/terms/term', :with => :active_record do

  # Indexes
  indexes title, :sortable => true
  indexes acronym
  indexes description
  indexes definition

  indexes sections.title, as: :section_titles
  indexes sections.body, as: :section_bodies

  indexes tools.title, as: :tool_titles
  indexes tools.description, as: :tool_descriptions

  # Attributes
  has id, as: :term_id
  has created_at, updated_at

  # Multi Value Attributes
  has themes(:id), as: :theme_ids
  has categories(:id), as: :category_ids
  has subcategories(:id), as: :subcategory_ids

end