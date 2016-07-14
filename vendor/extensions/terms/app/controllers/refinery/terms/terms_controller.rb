module Refinery
  module Terms
    class TermsController < ::ApplicationController

      before_filter :find_all_terms
      before_filter :find_term, only: [:show]
      before_filter :set_logo, only: [:show, :index]
      before_filter :find_page
      before_filter :check_for_master_theme, only: [:show]



      # exact matches
      # matches where the searched word is in the title
      # matches where the searched word was found anywhere in the text
      def index
        @exact = Term.where('LOWER(title) = ? OR LOWER(acronym) = ?', params[:q].to_s.downcase, params[:q].to_s.downcase).order(:title)
        @close = Term.where('title ILIKE ?', "%#{params[:q]}%").where('LOWER(title) != ? AND LOWER(acronym) != ?', params[:q].downcase, params[:q].downcase).order(:title)
        with = {}
        without = {}

        if params[:theme_id].present?
          @exact = @exact.with_theme_id(params[:theme_id])
          @close = @close.with_theme_id(params[:theme_id])
          with[:theme_ids] = [params[:theme_id].to_i]
        end

        if @exact.any?
          without[:term_id] ||= []
          without[:term_id].push(@exact.collect(&:id))
        end

        if @close.any?
          without[:term_id] ||= []
          without[:term_id].push(@close.collect(&:id))
        end

        @body = Term.search(params[:q], with: with, without: without, per_page: 1000)

        # TODO: Should we use length here as we plan on loading the association anyway?
        @count = @exact.size + @close.size + @body.total_entries

        present(@page)
      end

      def show
        @themes = Theme.themes.order(:title)
        
        @theme_title = @term.master_theme.title
        @theme_slug = "/themes/#{@term.master_theme.slug}"
        
        #We need to make sure the theme that's in the session is actually attached to the term
        @term.themes.each do |theme|
          if session[:breadcrumb_theme_title] && session[:breadcrumb_theme_title] == theme.title
            @theme_title = session[:breadcrumb_theme_title]
            @theme_slug = "/themes/#{session[:breadcrumb_theme_slug]}"
          end
        end

        add_breadcrumb @theme_title, @theme_slug

        add_breadcrumb @term.title, ""
        respond_to do |format|
          format.html
          format.pdf { render :pdf => @term.title.parameterize, disposition: 'inline', layout: 'pdf.html' }
        end

        present(@page)
      end

      protected

      def find_all_terms
        @terms = Term.order(:title)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/terms").first
      end

      def find_term
        @term = Term.find(params[:id])
      end

      def check_for_master_theme
        if @term.master_theme.nil?
          redirect_to refinery.root_path unless current_refinery_user
        end
      end

      def set_logo
        super
        # TODO: Switch to using exception handling?
        if @term && @term.master_theme && @term.master_theme.logo
          @logo = @term.master_theme.logo.url
        end
      end

    end
  end
end


