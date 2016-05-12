module Refinery
  module Terms
    class Reference < Url

      belongs_to :term, touch: true

    end
  end
end