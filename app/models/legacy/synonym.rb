module Legacy
  class Synonym < ActiveRecord::Base

    self.table_name = 'term_names'

    belongs_to :term

  end
end