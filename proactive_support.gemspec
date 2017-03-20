$:.push File.expand_path('../lib', __FILE__)
require 'proactive_support/version'

Gem::Specification.new do |s|
  s.name        = 'proactive_support'
  s.version     = ProactiveSupport::VERSION
  s.authors     = ['Steve Frank']
  s.email       = %w(steve@cloudhealthtech.com)
  s.homepage    = 'https://github.com/CloudHealth/proactive_support/wiki'
  s.summary     = 'Proactive Support module.'
  s.description = 'Proactive Support module.'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split("\n")

  s.require_paths = %w(lib)

  s.add_dependency 'activerecord', '>= 3'

  s.add_development_dependency 'sqlite3'
end
