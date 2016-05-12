module Refinery
  module Terms
    class Url < ActiveRecord::Base

      attr_accessible :position, :title, :type, :url, :term_id, :description

      validates :title, presence: true

      belongs_to :term, touch: true

    end
  end
end