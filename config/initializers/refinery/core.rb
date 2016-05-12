# encoding: utf-8
Refinery::Core.configure do |config|
  # When true will rescue all not found errors and display a friendly error page
  config.rescue_not_found = Rails.env.production?

  # When true this will force SSL redirection in all Refinery backend controllers.
  # config.force_ssl = false

  # When true will use Amazon's Simple Storage Service instead of
  # the default file system for storing resources and images
  # config.s3_backend = !(ENV['S3_KEY'].nil? || ENV['S3_SECRET'].nil?)

  # Use a custom Dragonfly storage backend instead of the default
  # file system for storing resources and images
  # config.dragonfly_custom_backend_class = nil
  # config.dragonfly_custom_backend_opts = {}

  # Whenever Refinery caches anything and can set a cache key, it will add
  # a prefix to the cache key containing the string you set here.
  # config.base_cache_key = :refinery

  # Site name
  config.site_name = "Biodiversity A-Z"

  # This activates Google Analytics tracking within your website. If this
  # config is left blank or set to UA-xxxxxx-x then no remote calls to
  # Google Analytics are made.
  # config.google_analytics_page_code = "UA-xxxxxx-x"

  # Enable/disable authenticity token on frontend
  # config.authenticity_token_on_frontend = false

  # Should set this if concerned about DOS attacks. See
  # http://markevans.github.com/dragonfly/file.Configuration.html#Configuration
  # config.dragonfly_secret = "0bdd3504e18a3f7ca932eba75d458337cf30702e4af91f68"

  # Add extra tags to the wymeditor whitelist e.g. = {'tag' => {'attributes' => {'1' => 'href'}}} or just {'tag' => {}}
  # config.wymeditor_whitelist_tags = {}

  # Register extra javascript for backend
  config.register_javascript = 'refinery/open_close_sections'
  config.register_javascript = 'refinery/term_validation'
  config.register_javascript = 'refinery/add_wymeditor.js'
  config.register_javascript = 'refinery/alert_unsaved_changes'
  config.register_javascript = 'refinery/related_terms'
  config.register_javascript = 'refinery/theme_picker'
  config.register_javascript = 'jquery.tokeninput.min'

  # Register extra stylesheet for backend (optional options)
  config.register_stylesheet "admin", :media => 'screen'

  # Specify a different backend path than the default of /refinery.
  # config.backend_route = "refinery"

end

