module Refinery
  module Terms
    module Admin
      class ThemesController < ::Refinery::AdminController

        crudify :'refinery/terms/theme',
                :xhr_paging => true

        before_filter :find_all_themes

        def children
        end

        private

        def find_all_themes
          @themes = Theme.children_of(params[:id])
        end

      end
    end
  end
end
