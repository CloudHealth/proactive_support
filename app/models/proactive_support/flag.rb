module ProactiveSupport
  class Flag < ::ActiveRecord::Base
    belongs_to :customer

    validates_presence_of :customer_id, :source, :identifier, :message
    serialize :filter, HashWithIndifferentAccess
    serialize :debug_params, HashWithIndifferentAccess
  end
end
