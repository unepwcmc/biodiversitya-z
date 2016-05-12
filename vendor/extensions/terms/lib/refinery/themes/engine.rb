module Refinery
  module Terms
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Terms

      engine_name :refinery_terms

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "themes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.terms_admin_themes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/terms/theme'
          }
          plugin.menu_match = %r{refinery/terms/themes(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Themes)
      end
    end
  end
end
