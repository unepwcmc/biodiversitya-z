module Refinery
  module Terms
    class TermTheme < Refinery::Core::BaseModel

      self.table_name = 'refinery_term_theme_associations'

      attr_accessible :theme_id, :term_id, :is_master

      belongs_to :term, touch: true
      belongs_to :theme, counter_cache: "terms_count"

      after_save :set_letter
      after_destroy :destroy_letter_term

      def master!
        term.term_themes.update_all(is_master: false)
        self.reload.update_attribute(:is_master, true)
      end

      private

      def set_letter
        if letter = letter_for_term_theme
          ids = letter.term_ids
          ids << term.id
          letter.term_ids = ids.to_set.to_a
        end
      end

      def destroy_letter_term
        if letter = letter_for_term_theme
          ids = letter.term_ids
          ids.reject! { |id| id == term.id }
          letter.term_ids = ids.to_set.to_a
        end
      end

      def letter_for_term_theme
        Letter.find_by_letter_and_theme_id(term.title.first.upcase, theme_id)
      end

    end
  end
end