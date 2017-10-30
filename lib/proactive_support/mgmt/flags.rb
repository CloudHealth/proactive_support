module ProactiveSupport
  module Mgmt
    class Flags
      class << self
        def set(customer_id, source, identifier, filter, message, options = {})
          digest = to_digest source, identifier, filter

          ::ProactiveSupport::Flag.where(customer_id: customer_id, digest: digest).first_or_initialize.tap do |f|
            f.source = source
            f.identifier = identifier
            f.filter = clean_object filter
            f.message = message
            f.level = options[:level] || ::ProactiveSupport::INFO
            f.debug_params = clean_object options[:debug_params]
            f.tags = options[:tags]
            f.is_transient = options.fetch(:transient, true) ? true : false
            f.last_triggered_at = ::Time.now
            f.is_active = true
            f.save!
          end
        end

        def clear(customer_id, source, identifier, filter)
          clear_matching customer_id, {digest: to_digest(source, identifier, filter)}
        end

        def clear_identifier(customer_id, source, identifier)
          clear_matching customer_id, {source: source, identifier: identifier}
        end

        def clear_source(customer_id, source)
          clear_matching customer_id, {source: source}
        end

        private

        def to_digest(source, identifier, filter)
          x = "#{source}:#{identifier}:#{filter}"
          ::Digest::SHA1.base64digest x
        end

        def clear_matching(customer_id, conditions)
          ::ProactiveSupport::Flag.where(customer_id: customer_id, is_active: true).update_all({is_active: false}, conditions)
        end

        def clean_object(data)
          if RUBY_PLATFORM == 'java'
            # This attempts to strip out any Java objects so we serialize with compatible MRI Ruby classes
            data = ::JSON.load(::JSON.dump(data))
          end
          ::HashWithIndifferentAccess.new data
        end
      end
    end
  end
end
