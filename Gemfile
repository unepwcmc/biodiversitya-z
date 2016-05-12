source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Deployment
gem 'capistrano', '~> 3.4', require: false
gem 'capistrano-rails',   '~> 1.1', require: false
gem 'capistrano-bundler', '~> 1.1', require: false
gem 'capistrano-rvm',   '~> 0.1', require: false
gem 'fog'
gem 'unf'
gem 'faker'
gem 'whenever', :require => false
gem 'capistrano-passenger', '~> 0.2.0', require: false


group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'refinerycms-testing', '~> 2.1.2', require: false
  gem 'spork-rails'
  gem 'guard', :require => false
  gem 'guard-rails'
  # gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-bundler', require: false
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
end

group :development do
  #gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails'
  gem 'compass-rails', '~> 2.0.0'
  gem 'compass', '~> 1.0.0.alpha.21'
  gem 'breakpoint'
  gem 'susy'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'friendly_id', '~> 4.0.10'
gem 'wicked_pdf'
gem 'annotate', '~> 2.6.5'

gem 'pg'
gem 'mysql2',          '0.3.20', :platform => :ruby
gem 'jdbc-mysql',      '5.1.28',   :platform => :jruby
gem 'thinking-sphinx', '~> 3.1.0'
gem 'eventmachine', '~> 1.0.8'
gem "breadcrumbs_on_rails"

# Refinery CMS
gem 'refinerycms', '~> 2.1.0'

# Refinery CMS Vendor Extensions
gem 'refinerycms-search', '~> 2.1.0'
gem 'refinerycms-copywriting'
gem 'refinerycms-nested_models'

# Refinery CMS Custom Extensions
gem 'refinerycms-terms', :path => 'vendor/extensions'
