require 'shopify_cli'

module ShopifyCli
  module Tasks
    class TaskRegistry
      def initialize
        @tasks = {}
      end

      def add(const, name)
        @tasks[name] = const
      end

      def [](name)
        @tasks[name]
      end
    end

    Registry = TaskRegistry.new

    def self.register(task, name, path)
      autoload(task, path)
      Registry.add(const_get(task), name)
    end

    register :CreateApiClient, :create_api_client, 'shopify-cli/tasks/create_api_client'
    register :EnsureEnv, :ensure_env, 'shopify-cli/tasks/ensure_env'
    register :EnsureLoopbackURL, :ensure_loopback_url, 'shopify-cli/tasks/ensure_loopback_url'
    register :EnsureTestShop, :ensure_test_shop, 'shopify-cli/tasks/ensure_test_shop'
    register :UpdateDashboardURLS, :update_dashboard_urls, 'shopify-cli/tasks/update_dashboard_urls'
  end
end
