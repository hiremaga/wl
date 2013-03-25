require 'api_smith'

module Wl
  module Models
    class Task < APISmith::Smash
      property :id
      property :assignee_id
      property :completed_at
      property :created_at
      property :created_by_id
      property :deleted_at
      property :due_date
      property :list_id
      property :local_identifier
      property :note
      property :owner_id
      property :parent_id
      property :position
      property :recurrence_count
      property :recurrence_type
      property :recurring_parent_id
      property :starred
      property :title
      property :type
      property :updated_at
      property :updated_by_id
      property :user_id
      property :version
      property :errors
    end
  end
end
