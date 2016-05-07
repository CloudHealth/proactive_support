# No great way to have a non-rails gem and also a rails engine...
if defined?(Rails) && Rails.respond_to?(:version) && Rails.respond_to?(:root)
  require 'proactive_support/engine'
end

module ProactiveSupport

  INFO = 0
  WARNING = 1
  ERROR = 2

  autoload :Note, ::File.expand_path('../../app/models/proactive_support/note.rb', __FILE__)
  autoload :Flag, ::File.expand_path('../../app/models/proactive_support/flag.rb', __FILE__)

  class AlertAdapterNotConfigured < ::StandardError; end

  class Configuration
    attr_accessor :transient_expiration, :alert_adapter
  end

  class << self
    attr_writer :configuration

    def level_to_bootstrap(level)
      case level
        when INFO then 'info'
        when WARNING then 'warning'
        when ERROR then 'danger'
        else ''
      end
    end
  end

  module_function
  def configuration
    @configuration ||= Configuration.new.tap do |c|
      c.transient_expiration = 1.day
    end
  end

  def configure
    yield(configuration)
  end
end

require 'proactive_support/mgmt/flags'
require 'proactive_support/mgmt/notes'
require 'proactive_support/mgmt/alerts'
