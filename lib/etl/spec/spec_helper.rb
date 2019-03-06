require 'bundler/setup'
require 'light-service/testing'
require 'etl'
require 'byebug'
require 'factory_bot'

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  
  config.include FactoryBot::Syntax::Methods
  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
