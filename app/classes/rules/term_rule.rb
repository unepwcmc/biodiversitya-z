module Rules
  class TermRule < RedirectRule
    def applicable?
      @requested_url.include?('terms')
    end

    def redirection_url
      p "LEGIS #{legacy_id}"
      if legacy_id && term = Refinery::Terms::Term.find_by_legacy_id_and_legacy_type(legacy_id, 2)
        return "/content/#{term.slug}"
      end
    end

    def legacy_id
      @params[:id].present?? @params[:id] : @requested_url.match(/^\/terms\/(\d+)/)[1]
    end
  end
end