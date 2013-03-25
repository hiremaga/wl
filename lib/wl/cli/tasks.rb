require 'thor'

module Wl
  module CLI
    class Tasks < Thor
      desc 'index', 'Lists all your tasks'
      def index
        say client.tasks.to_json
      end

      default_task :index

      private
      def client
        Client.new(dotwl: Dotwl.new)
      end
    end
  end
end
