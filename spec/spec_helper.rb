$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wl'

Dir['spec/helpers/**/*.rb'].each { |helper| require File.expand_path(helper) }

RSpec.configure do |c|
  c.include CaptureOutput
end
