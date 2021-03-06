# frozen_string_literal: true
require 'shopify_cli'

module Node
  module Commands
    class Deploy < ShopifyCli::Command
      subcommand :Heroku, 'heroku', Project.project_filepath('commands/deploy/heroku')

      def call(*)
        @ctx.puts(self.class.help)
      end

      def self.help
        <<~HELP
          Deploy the current Node project to a hosting service. Heroku ({{underline:https://www.heroku.com}}) is currently the only option, but more will be added in the future.
            Usage: {{command:#{ShopifyCli::TOOL_NAME} deploy [ heroku ]}}
        HELP
      end

      def self.extended_help
        <<~HELP
        {{bold:Subcommands:}}
          {{cyan:heroku}}: Deploys the current Node project to Heroku.
            Usage: {{command:#{ShopifyCli::TOOL_NAME} deploy heroku}}
        HELP
      end
    end
  end
end
