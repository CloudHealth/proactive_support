# No great way to have a gem and also an engine...
if defined?(Rails) && Rails.respond_to?(:version) && Rails.respond_to?(:root)
  require 'proactive_support/engine'
end

module ProactiveSupport
end
