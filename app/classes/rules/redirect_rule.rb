module Rules
  class RedirectRule
    def initialize(requested_url)
      @requested_url = requested_url
      @parsed_url = URI.parse(requested_url)
      @params = @parsed_url.query.present?? CGI.parse(@parsed_url.query).with_indifferent_access : {}
    end

    def applicable?
      false
    end

    def redirection_url
      raise NotImplementedError, "Please implement 'redirection_url' in your rule class: #{self.class.name}"
    end

    def legacy_id
      @params[:id]
    end
  end
end