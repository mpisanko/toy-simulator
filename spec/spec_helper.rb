require "bundler"
Bundler.setup

require "rspec"
require "toy_simulator"

RSpec.configure do |config|
  config.color = true
  config.tty = true
end