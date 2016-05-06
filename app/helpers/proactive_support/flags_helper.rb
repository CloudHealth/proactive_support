module ProactiveSupport
  module FlagsHelper
    def get_flag_groupings(customer_id, filter_transients = true)
      flags = {}
      ar = ::ProactiveSupport::Flag.where(customer_id: customer_id, is_active: true)
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
