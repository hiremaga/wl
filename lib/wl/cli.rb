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

      login = client.login(email, password)

      say login.to_json
    end

    desc 'tasks', 'Lists all your tasks'
    def tasks
      say client.tasks.to_json
    end

    desc 'lists', 'Lists all your lists'
    def lists
      say client.lists.to_json
    end

    private
    def client
      @client ||= Wl::Client.new(dotwl: Dotwl.new)
    end

    def ui
      @ui ||= HighLine.new
    end
  end
end
