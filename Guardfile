# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html))).*}) { |m| "/assets/#{m[3]}" }
end

guard 'rails' do
  watch('Gemfile.lock')
  watch(%r{^(config|lib)/.*})
end

# guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
#  watch('config/application.rb')
#  watch('config/environment.rb')
#  watch('config/environments/test.rb')
#  watch(%r{^config/initializers/.+\.rb$})
#  watch('Gemfile.lock')
#  watch('spec/spec_helper.rb') { :rspec }
#  watch('test/test_helper.rb') { :test_unit }
#  watch(%r{features/support/}) { :cucumber }
#  watch(%r{^spec/support/.+\.rb$})
# end

# guard :rspec, :all_on_start => false, :all_after_pass => false, cmd: 'bundle exec rspec --drb' do
#  watch(%r{^spec/.+_spec\.rb$})
#  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
#  watch('spec/spec_helper.rb')  { "spec" }

#  # Rails example
#  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
#  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
#  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
#  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
#  watch('config/routes.rb')                           { "spec/routing" }
#  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

#  # Capybara features specs
#  watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$})     { |m| "spec/features/#{m[1]}_spec.rb" }

#  # Turnip features and steps
#  watch(%r{^spec/acceptance/(.+)\.feature$})
#  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
# end

guard :bundler do
  watch('Gemfile')
end
