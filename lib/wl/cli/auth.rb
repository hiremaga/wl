require 'thor'
require 'highline'

module Wl
  module CLI
    class Auth < Thor
      desc 'login', 'Log in to Wunderlist'
      option :email, desc: 'Wunderlist email'
      option :password, desc: 'Wunderlist password'
      def login
        email = options[:email] || ui.ask('Wunderlist email: ')
        password = options[:password] || ui.ask('Wunderlist password: ') { |q| q.echo = '*' }

        login = client.login(email, password)

        say login.to_json
      end

      private
      def ui
        HighLine.new
      end

      def client
        Client.new(dotwl: Dotwl.new)
      end
    end
  end
end
