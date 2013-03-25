require 'thor'

module Wl
  module CLI
    class Root < Thor
      register Auth,  :auth,  'auth',  'Manage your authentication credentials'
      register Tasks, :tasks, 'tasks', 'Manage your tasks'
      register Lists, :lists, 'lists', 'Manage your lists'
    end
  end
end
