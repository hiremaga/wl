require 'thor'

module Wl
  class CLI < Thor
    desc 'login', 'Logs in to Wunderlist'
    option :email,    desc: 'Wunderlist email'
    option :password, desc: 'Wunderlist password'
    def login
      email    = options[:email]    || ask('Wunderlist email:')
      password = options[:password] || ask('Wunderlist password:')

      client = Wl::Client.new
      login = client.login(email, password)

      say login.to_json
    end
  end
end
