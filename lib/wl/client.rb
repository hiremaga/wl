require 'api_smith'

module Wl
  class Client < APISmith::Base
    base_uri 'https://api.wunderlist.com/'

    def login(email, password)
      response = post('login', extra_query: {email: email, password: password}, as: Login)
      if response.code == 200
        Login.new(response.parsed_response)
      else
        raise response.inspect
      end
    end
  end
end
