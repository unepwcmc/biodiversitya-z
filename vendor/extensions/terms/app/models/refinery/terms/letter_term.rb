module Refinery
  module Terms
    class LetterTerm < Refinery::Core::BaseModel

      self.table_name = 'refinery_letter_terms'

      belongs_to :letter, counter_cache: true
      belongs_to :term

    end
  end
end