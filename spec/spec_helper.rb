require 'spork'

Spork.prefork do

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|

    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
    config.include Warden::Test::Helpers
    config.include Devise::TestHelpers,type: :controller

    Warden.test_mode!

    # Requires supporting files with custom matchers and macros, etc,
    # in ./support/ and its subdirectories including factories.
    ([Rails.root.to_s] | ::Refinery::Plugins.registered.pathnames).map{|p|
      Dir[File.join(p, 'spec', 'support', '**', '*.rb').to_s]
    }.flatten.sort.each do |support_file|
      require support_file
    end

  end
end

Spork.each_run do

  FactoryGirl.reload

end