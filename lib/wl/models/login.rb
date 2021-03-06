require 'api_smith'

module Wl
  module Models
    class Login < APISmith::Smash
      property :id
      property :product
      property :name
      property :settings
      property :created_at
      property :updated_at
      property :email
      property :token
      property :avatar
      property :confirmation_state
      property :type
      property :email_confirmed
      property :errors
    end
  end
end
