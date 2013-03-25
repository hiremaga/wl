require 'thor'

module Wl
  module CLI
    class Lists < Thor
      desc 'index', 'Lists all your lists'
      def index
        say client.lists.to_json
      end

      default_task :index

      private
      def client
        Client.new(dotwl: Dotwl.new)
      end
    end
  end
end
