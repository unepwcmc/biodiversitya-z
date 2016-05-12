module Refinery
  module Terms
    class Letter < Refinery::Core::BaseModel

      self.table_name = 'refinery_theme_letters'

      belongs_to :theme

      has_many :letter_terms
      has_many :terms, through: :letter_terms, order: 'title ASC'

      def terms?
        letter_terms_count > 0
      end

      class << self

        def for_theme(theme_id)
          where(theme_id: theme_id)
        end

      end

    end
  end
end