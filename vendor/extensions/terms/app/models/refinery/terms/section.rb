module Refinery
  module Terms
    class Section < Refinery::Core::BaseModel

      # # attr_accessible :title, :body, :position

      validates :title, presence: true
      validates :body, presence: true

      belongs_to :term, touch: true

    end
  end
end