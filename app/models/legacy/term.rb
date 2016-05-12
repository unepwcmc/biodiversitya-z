module Legacy
  class Term < ActiveRecord::Base

    self.table_name = 'terms'

    has_many :grouping_terms
    has_many :groupings, through: :grouping_terms
    has_many :synonyms

    def references_as_array
      parts = references.split(/fn\d+\./)
      parts.reject!(&:empty?)
      parts.collect(&:strip)
    end

    def context_as_array
      headings = context.scan(/\*(.+)\*/).flatten
      parts = context.split(/\*.+\*/)
      parts.reject!(&:empty?)
      parts.collect(&:strip)
      [headings, parts]
    end

  end
end