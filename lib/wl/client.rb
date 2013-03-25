require 'shy'
require 'api_smith'

module Wl
  class Client
    include Shy
    include APISmith::Client
    base_uri 'https://api.wunderlist.com/'
    shy :dotwl

    def login(email, password)
      login = post('login', extra_query: {email: email, password: password}, transformer: Login)
      dotwl.login(login)
      login
    end

    def tasks
      get('me/tasks', transformer: Task)
    end

    def base_request_options
      if dotwl.token
        {
          headers: {
            'Authorization' => "Bearer #{dotwl.token}"
          }
        }
      else
        super
      end
    end
  end
end
