# No great way to have a non-rails gem and also a rails engine...
if defined?(Rails) && Rails.respond_to?(:version) && Rails.respond_to?(:root)
  require 'proactive_support/engine'
end

module ProactiveSupport
  autoload :Note, ::File.expand_path('../../app/models/proactive_support/note.rb', __FILE__)
  autoload :Flag, ::File.expand_path('../../app/models/proactive_support/flag.rb', __FILE__)
end

require 'proactive_support/mgmt/flags'
