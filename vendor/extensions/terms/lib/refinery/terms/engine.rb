module Refinery
  module Terms
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Terms

      engine_name :refinery_terms

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "terms"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.terms_admin_terms_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/terms/term'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Terms)
      end
    end
  end
end
