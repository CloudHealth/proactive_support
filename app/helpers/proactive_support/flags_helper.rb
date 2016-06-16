module ProactiveSupport
  module FlagsHelper
    def get_flag_groupings(customer_id = nil, filter_transients = true)
      flags = {}
      ar = ::ProactiveSupport::Flag.where(is_active: true)
      ar = ar.where(customer_id: customer_id) if customer_id
      ar = ar.filter_transients if filter_transients
      ar.each do |f|
        flags[f.level] ||= {}
        flags[f.level][f.source] ||= {}
        flags[f.level][f.source][f.identifier] ||= {message: f.message, count: 0, transients: 0}
        flags[f.level][f.source][f.identifier][:count] += 1
        flags[f.level][f.source][f.identifier][:transients] += 1 if f.is_transient
      end
      Hash[flags.sort.reverse] # errors first...
    end
  end
end
