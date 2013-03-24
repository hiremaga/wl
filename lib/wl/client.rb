require 'shy'
require 'api_smith'

module Wl
  class Client < Shy.new(:dotwl)
    include APISmith::Client
    base_uri 'https://api.wunderlist.com/'

    def login(email, password)
      post('login', extra_query: {email: email, password: password}, transformer: Login)
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
