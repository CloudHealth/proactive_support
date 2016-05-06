module ProactiveSupport
  class Engine < ::Rails::Engine
    isolate_namespace ProactiveSupport

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each { |ext| load ext }
    end
  end
end
