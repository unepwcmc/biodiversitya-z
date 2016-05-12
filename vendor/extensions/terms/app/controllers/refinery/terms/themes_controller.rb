module Refinery
  module Terms
    class ThemesController < ::ApplicationController

      before_filter :find_theme
      before_filter :find_category
      before_filter :set_logo
      before_filter :find_all_themes
      before_filter :find_page

      def index
        present(@page)
      end

      def show
        session[:breadcrumb_theme_title] = @theme.title
        session[:breadcrumb_theme_slug] = @theme.slug
        add_breadcrumb @theme.title, ""
        @letters = params[:category_id].present?? Letter.for_theme(params[:category_id]).order('letter ASC') : @theme.letters

        present(@page)
      end

      protected

      def find_all_themes
        @themes = Theme.themes.order(:title)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/themes").first
      end

      def find_theme
        @theme = Theme.find(params[:id])
      end

      def find_category
        @category = Theme.find_by_id(params[:category_id]) || @theme
      end

      def set_logo
        super
        @logo = @theme.logo.url if @theme.logo
      end

    end
  end
end
