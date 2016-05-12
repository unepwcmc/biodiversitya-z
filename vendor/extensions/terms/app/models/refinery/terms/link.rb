module Refinery
  module Terms
    class Link < Url

      belongs_to :term, touch: true

    end
  end
end