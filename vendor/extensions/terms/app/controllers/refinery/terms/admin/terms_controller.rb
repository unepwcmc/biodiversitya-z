module Refinery
  module Terms
    module Admin
      class TermsController < ::Refinery::AdminController

        crudify :'refinery/terms/term',
                :xhr_paging => true,
                :conditions => 'acronym_id IS NULL',
                :order => 'title ASC'

        before_filter :find_term, only: [:update, :edit, :destroy]

        # Intentionally breaking RESTful design (adding a search action instead of relying on the index action).  This
        # means we don't have to lose the out-the-box functionality provided by the `crudify` method.
        def search
          @terms = Term.includes(:master_theme).where('title ILIKE ?', "%#{params[:q]}%").order(:title)
          respond_to do |format|
            format.json { render json: @terms.map { |t| {id: t.id, title: t.title = "#{t.title} (#{t.master_theme_title})"} } }
          end
        end

        def mass_edit
          @theme = Refinery::Terms::Theme.find(params[:theme_id])
          @terms = @theme.terms.order(:title)
        end

        def mass_save
          params[:terms].each do |term|
            if term[1][:legacy_id]
              t = Term.find(term[0])
              t.update_attribute(:legacy_type, term[1][:legacy_type])
              t.update_attribute(:legacy_id, term[1][:legacy_id])
            end
          end
          redirect_to refinery.terms_admin_terms_path
        end

      end
    end
  end
end