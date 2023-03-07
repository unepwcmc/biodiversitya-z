# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-terms'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Terms extension for Refinery CMS'
  s.date              = '2014-07-25'
  s.summary           = 'Terms extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = ['Stuart Bates']

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 3.0.6'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.6'
end
