module ProactiveSupport
  module Mgmt
    class Flags
      class << self
        def set(customer_id, source, identifier, filter, message, options = {})
          digest = to_digest source, identifier, filter

          f = ::ProactiveSupport::Flag.where(customer_id: customer_id, is_active: true, digest: digest).first
          if f
            f.last_triggered_at = ::Time.now
            f.save!
            return f
          end

          ::ProactiveSupport::Flag.new.tap do |f|
            f.customer_id = customer_id
            f.digest = digest
            f.source = source
            f.identifier = identifier
            f.filter = HashWithIndifferentAccess.new filter
            f.message = message
            f.level = options[:level]
            f.debug_params = options[:debug_params]
            f.tags = options[:tags]
            f.last_triggered_at = ::Time.now
            f.is_active = true
            f.save!
          end
        end

        def clear(customer_id, source, identifier, filter)
          ::ProactiveSupport::Flag.where(customer_id: customer_id, is_active: true).update_all({is_active: false}, {digest: to_digest(source, identifier, filter)})
        end

        private

        def to_digest(source, identifier, filter)
          x = "#{source}:#{identifier}:#{filter}"
          ::Digest::SHA1.base64digest x
        end
      end
    end
  end
end
