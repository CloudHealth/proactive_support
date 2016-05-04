module ProactiveSupport
  class Note < ::ActiveRecord::Base
    belongs_to :customer
    belongs_to :user

    validates_presence_of :customer_id
    validates_presence_of :title
  end
end
