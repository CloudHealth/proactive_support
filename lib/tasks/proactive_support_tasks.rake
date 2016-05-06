namespace :proactive_support do
  desc 'Set a flag'
  task :set, [:customer_id, :source, :identifier, :message] do |_, args|
    Customer.using_data_shard_for(args[:customer_id]) do
      ::ProactiveSupport::Mgmt::Flags.set args[:customer_id], args[:source], args[:identifier], {}, args[:message]
    end
  end

  desc 'Clear all flags'
  task :clear do
    ::Multidb.run_on_all_shards do
      ::ProactiveSupport::Flag.update_all({is_active: false}, {is_active: true})
    end
  end
end
