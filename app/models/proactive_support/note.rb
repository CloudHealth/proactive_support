module ProactiveSupport
  class Note < ::ActiveRecord::Base
    self.table_name = 'proactive_support_notes' # Needed for activerecord-jdbc-adapter

    belongs_to :customer
    belongs_to :user

    validates_presence_of :customer_id
    validates_presence_of :title
  end
end
