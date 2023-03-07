source 'https://rubygems.org'

gem 'rails', '4.2.10'

# Deployment
gem 'capistrano', '~> 3.10', require: false
gem 'capistrano-rails',   '~> 1.2', require: false
gem 'capistrano-bundler', '~> 1.2', require: false
gem 'capistrano-rvm',   '~> 0.1', require: false
gem 'fog'
gem 'unf'
gem 'faker'
gem 'whenever', :require => false
gem 'capistrano-passenger', '~> 0.2.0', require: false


group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.6.0'
  gem 'capybara', '~> 2.4.3'
  gem 'refinerycms-testing', '~> 3.0.6', require: false
  gem 'spork-rails'
  gem 'guard', :require => false
  gem 'guard-rails'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-bundler', require: false
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

group :assets do
  gem 'coffee-rails', '~> 4.2.0'
  gem 'sass-rails'
  gem 'compass-rails', '~> 3.0.0'
  gem 'compass', '~> 1.0.3'
  gem 'breakpoint'
  gem 'susy'
  gem 'uglifier', '>= 3.2.0'
end

gem 'jquery-rails'
gem 'friendly_id', '~> 5.1.0'
gem 'wicked_pdf'
gem 'annotate', '~> 2.7.0'

gem 'pg', '~> 0.20'
gem 'mysql2',          '0.4.10', :platform => :ruby
gem 'jdbc-mysql',      '5.1.42',   :platform => :jruby
gem 'thinking-sphinx', '~> 4.0.0'
gem 'eventmachine', '~> 1.2.0'
gem "breadcrumbs_on_rails"

# Refinery CMS
gem 'refinerycms'#, '~> 3.0.6'

# Refinery CMS Vendor Extensions
gem 'refinerycms-search'#, '~> 2.1.0'
gem 'refinerycms-images'#,'~> 3.0.6'
gem 'refinerycms-resources'#, '~> 3.0.6'
gem 'refinerycms-pages'#, '~> 3.0.6'
gem 'refinerycms-acts-as-indexed'#, '~> 3.0.0'
gem 'refinerycms-copywriting', :git => 'https://github.com/unixcharles/refinerycms-copywriting.git' 
gem 'refinerycms-nested_models'

# Refinery CMS Custom Extensions
gem 'refinerycms-terms', :path => 'vendor/extensions'
