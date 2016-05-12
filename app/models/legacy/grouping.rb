module Legacy
  class Grouping < ActiveRecord::Base

    self.table_name = 'term_groupings'

    acts_as_nested_set

    has_many :grouping_terms, foreign_key: :term_grouping_id

  end
end