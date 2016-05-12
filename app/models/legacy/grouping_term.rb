module Legacy
  class GroupingTerm < ActiveRecord::Base

    self.table_name = 'term_term_groupings'

    belongs_to :grouping, foreign_key: :term_grouping_id
    belongs_to :term

  end
end