module ProactiveSupport
  module Mgmt
    class Notes
      class << self
        def create(customer_id, user_id, title, options = {})
          ::ProactiveSupport::Note.new.tap do |n|
            n.customer_id = customer_id
            n.user_id = user_id
            n.title = title
            n.content = options[:content]
            n.level = options[:level]
            n.tags = options[:tags]
            n.is_active = true
            n.save!
          end
        end
      end
    end
  end
end
