module Refinery
  module Terms
    class Tool < Url

      belongs_to :term, touch: true

    end
  end
end