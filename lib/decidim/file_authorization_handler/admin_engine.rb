# frozen_string_literal: true

module Decidim
  module FileAuthorizationHandler
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::FileAuthorizationHandler::Admin

      routes do
        resource :censuses, only: [:show, :create, :destroy]
      end

      initializer "decidim_file_authorization.add_admin_menu" do
        Decidim.menu :admin_menu do |menu|
          menu.item I18n.t("decidim.file_authorization_handler.admin.menu.census"),
                    decidim_file_authorization_handler_admin.censuses_path,
                    icon_name: "spreadsheet",
                    position: 7,
                    active: :inclusive
        end
      end

      initializer "decidim_file_aurhorization.register_icons" do
        Decidim.icons.register(name: "spreadsheet", icon: "table-2", category: "system", description: "", engine: :file_authorization_handler)
      end
    end
  end
end
