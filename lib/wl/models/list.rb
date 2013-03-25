require 'api_smith'

module Wl
  module Models
    class List < APISmith::Smash
      property :title
      property :created_at
      property :updated_at
      property :version
      property :local_identifier
      property :position
      property :type
      property :id
      property :owner_id
      property :errors
    end
  end
end
