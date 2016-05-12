class RedirectHandler

  def initialize(requested_url)
    @requested_url = requested_url
    @klasses = %w(term_rule area_rule)
  end

  def redirection_url
    compute_url(@klasses, @requested_url)
  end

  private

  def compute_url(klasses, requested_url)
    klasses.each do |klass|
      rule = "rules/#{klass}".classify.constantize.new(requested_url)
      return rule.redirection_url if rule.applicable?
    end
    nil
  end

end