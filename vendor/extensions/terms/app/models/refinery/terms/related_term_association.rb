module Refinery
  module Terms
    class RelatedTermAssociation < Refinery::Core::BaseModel

      self.table_name = 'refinery_related_term_associations'

      belongs_to :term
      belongs_to :related_term, class_name: 'Refinery::Terms::Term'

    end
  end
end