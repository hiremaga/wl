require 'api_smith'

module Wl
  class Client < APISmith::Base
    base_uri 'https://api.wunderlist.com/'

    def login(email, password)
      post('login', extra_query: {email: email, password: password}, transformer: Login)
    end
  end
end
