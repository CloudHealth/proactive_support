module ProactiveSupport
  class Flag < ::ActiveRecord::Base
    self.table_name = 'proactive_support_flags' # Needed for activerecord-jdbc-adapter

    belongs_to :customer

    validates_presence_of :customer_id, :source, :identifier, :message
    serialize :filter, HashWithIndifferentAccess
    serialize :debug_params, HashWithIndifferentAccess

    scope :filter_transients, -> { where("is_transient = 0 OR (is_transient = 1 AND UNIX_TIMESTAMP(last_triggered_at) > #{(::Time.now - ::ProactiveSupport.configuration.transient_expiration).to_i})") }
  end
end
