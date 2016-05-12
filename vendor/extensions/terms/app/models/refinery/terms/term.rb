module Refinery
  module Terms
    class Term < Refinery::Core::BaseModel

      self.table_name = 'refinery_terms'

      attr_accessible :title, :definition, :description, :acronym, :related_term_tokens, :position, :definition_title, :association_ids, :featured_image_id, :master_id, :caption
      attr_accessible :legacy_type, :legacy_id
      attr_reader :related_term_tokens

      # Used to allow access of param in model
      attr_accessor :master_id
      validates :master_id, presence: true

      def related_term_tokens=(ids)
        self.related_term_ids = ids.split(',')
      end

      acts_as_indexed :fields => [:title]

      validates :title, presence: true
      #validates :definition, presence: true
      #validates :description, presence: true

      belongs_to :featured_image, class_name: '::Refinery::Image'

      extend FriendlyId
      friendly_id :title, use: :slugged

      # Sections association
      has_many :sections, :order => 'position ASC'
      accepts_nested_attributes_for :sections, allow_destroy: true
      attr_accessible :sections_attributes

      # References association
      has_many :references, :order => 'position ASC'
      accepts_nested_attributes_for :references, allow_destroy: true
      attr_accessible :references_attributes

      # Links association
      has_many :links, :order => 'position ASC'
      accepts_nested_attributes_for :links, allow_destroy: true
      attr_accessible :links_attributes

      # Tools association
      has_many :tools, :order => 'position ASC'
      accepts_nested_attributes_for :tools, allow_destroy: true
      attr_accessible :tools_attributes

      # Related terms
      has_many :related_term_associations
      has_many :related_terms, :through => :related_term_associations
      has_many :inverse_related_term_associations, class_name: 'Refinery::Terms::RelatedTermAssociation', foreign_key: :related_term_id
      has_many :inverse_related_terms, :through => :inverse_related_term_associations, :source => :term

      has_many :term_themes

      has_many :associations, through: :term_themes, source: :theme, dependent: :destroy
      has_many :themes, through: :term_themes, conditions: { depth: 0 }
      has_many :categories, through: :term_themes, conditions: { depth: 1 }, source: :theme
      has_many :subcategories, through: :term_themes, conditions: { depth: 2 }, source: :theme

      # Theme associations
      accepts_nested_attributes_for :associations, allow_destroy: true
      attr_accessible :associations_attributes

      # Master theme
      has_one :term_theme, class_name: 'Refinery::Terms::TermTheme', conditions: { is_master: true }
      has_one :master_theme, through: :term_theme, source: :theme
      delegate :title, :banner, :synopsis, :description, :tagline, :image_citation, to: :master_theme, prefix: true, allow_nil: true

      has_one :child_term, class_name: 'Refinery::Terms::Term', foreign_key: :acronym_id, dependent: :delete
      belongs_to :parent_term, class_name: 'Refinery::Terms::Term', foreign_key: :acronym_id

      has_many :letter_terms
      has_many :letters, through: :letter_terms

      after_save :set_master_theme
      after_save :process_acronym

      def master_theme_id
        master_theme.try(:id)
      end

      def title
        return super unless acronym?
        "#{read_attribute(:title)} (#{acronym})"
      end

      class << self

        def with_theme_id(theme_id)
          joins(:term_themes).where('refinery_term_theme_associations.theme_id = ?', theme_id)
        end

        def full
          where(acronym_id:nil)
        end

      end

      protected

      def set_master_theme
        if @master = term_themes.find_by_theme_id(master_id)
          @master.master!
        end
      end

      # TODO: Refactor to remove duplication of definition for acronyms
      # TODO: Refactor to abstract create child term into a separate method
      def process_acronym
        if acronym.present?
          if child_term.present?
            child_term.update_attribute(:title, acronym)
            child_term.update_attribute(:definition, "<a href=\"/content/#{slug}\">#{title}</a>")
          else
            acronyms_theme = Refinery::Terms::Theme.find_or_create_by_title('Acronyms') do |t|
              t.tagline = 'Acronym tagline'
              t.synopsis = 'Acronym synopsis'
              t.description = 'Acronym description'
            end
            create_child_term(
                {
                    title:acronym,
                    definition:"<a href=\"/content/#{slug}\">#{title}</a>",
                    master_id:acronyms_theme.id,
                    association_ids:association_ids.push(master_id).push(acronyms_theme.id)
                }
            )
          end
        else
          child_term.destroy if child_term.present?
        end
      end

    end
  end
end