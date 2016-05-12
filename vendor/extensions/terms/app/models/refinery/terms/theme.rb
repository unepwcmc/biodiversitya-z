module Refinery
  module Terms
    class Theme < Refinery::Core::BaseModel

      attr_accessible :title, :position, :parent_id, :logo_id, :banner_id, :tagline, :description, :synopsis, :icon_id, :image_citation

      validates :description, presence: true
      validates :tagline, presence: true, if: :is_theme?
      validates :title, presence: true
      validates :synopsis, presence: true, if: :is_theme?

      # Mixins
      acts_as_nested_set
      acts_as_indexed :fields => [:title]

      extend FriendlyId
      friendly_id :title, use: :slugged

      # Terms association
      has_many :term_themes, dependent: :delete_all
      has_many :terms, through: :term_themes

      has_many :letters, class_name: '::Refinery::Terms::Letter', dependent: :delete_all, order: :letter

      # Images
      belongs_to :logo, class_name: '::Refinery::Image'
      belongs_to :banner, class_name: '::Refinery::Image'
      belongs_to :icon, class_name: '::Refinery::Image'

      after_create :create_letters

      class << self

        def themes
          where(depth:0)
        end

        def categories
          where(depth:1)
        end

        def subcategories
          where(depth:2)
        end

        def children_of(parent_id)
          where(parent_id: parent_id)
        end

      end

      private

      def create_letters
        ('A'..'Z').each do |letter|
          letters.create({letter:letter}, without_protection: true)
        end
      end

      def is_theme?
        !parent_id?
      end

    end
  end
end