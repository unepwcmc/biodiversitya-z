module Rules
  class AreaRule < RedirectRule
    def applicable?
      @requested_url.include?('areas')
    end

    def redirection_url
      if legacy_id && term = Refinery::Terms::Term.find_by_legacy_id_and_legacy_type(legacy_id, 3)
        return "/content/#{term.slug}"
      end
    end

    def legacy_id
      @params[:id].present?? @params[:id] : @requested_url.match(/^\/areas\/(\d+)/)[1]
    end
  end
end