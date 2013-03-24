require 'thor'
require 'highline'

module Wl
  class CLI < Thor
    desc 'login', 'Logs in to Wunderlist'
    option :email, desc: 'Wunderlist email'
    option :password, desc: 'Wunderlist password'

    def login
      email = options[:email] || ui.ask('Wunderlist email: ')
      password = options[:password] || ui.ask('Wunderlist password: ') { |q| q.echo = '*' }

      client = Wl::Client.new
      login = client.login(email, password)

      dotwl = Dotwl.new
      dotwl.login(login)

      say login.to_json
    end

    private
    def ui
      @ui ||= HighLine.new
    end
  end
end
