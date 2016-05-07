module ProactiveSupport
  module Mgmt
    class Alerts
      class << self
        def info(customer_id, message, options = {})
          create 'info', customer_id, message, options
        end

        def warn(customer_id, message, options = {})
          create 'warn', customer_id, message, options
        end

        def error(customer_id, message, options = {})
          create 'error', customer_id, message, options
        end

        private

        def create(level, customer_id, message, options)
          raise ::ProactiveSupport::AlertAdapterNotConfigured if ::ProactiveSupport.configuration.alert_adapter.nil?
          ::ProactiveSupport.configuration.alert_adapter.new.create(level, customer_id, message, options)
        end
      end
    end
  end
end
