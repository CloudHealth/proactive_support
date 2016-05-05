module ProactiveSupport
  module FlagsHelper
    def get_flag_groupings(customer_id)
      flags = {}
      ::ProactiveSupport::Flag.where(customer_id: customer_id, is_active: true).each do |f|
        flags[f.source] ||= {}
        flags[f.source][f.level] ||= {}
        flags[f.source][f.level][f.identifier] ||= {message: f.message, count: 0}
        flags[f.source][f.level][f.identifier][:count] += 1
      end
      flags
    end
  end
end
