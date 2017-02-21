module ProactiveSupport
  class Note < ::ActiveRecord::Base
    # Remove this when all models are protected and protection is globally set
    include ActiveModel::ForbiddenAttributesProtection

    self.table_name = 'proactive_support_notes' # Needed for activerecord-jdbc-adapter

    belongs_to :customer
    belongs_to :user

    validates_presence_of :customer_id
    validates_presence_of :title
  end
end
