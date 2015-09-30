$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'fyber'
require 'fyber/client'

require 'webmock/rspec'
require 'vcr'
require 'pry'
require 'dotenv'
require 'awesome_print'
require 'timecop'
Dotenv.load

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.configure do |config|
  config.before(:each) do
    Fyber.configure do |c|
      c.api_key = ENV['API_KEY']
    end
  end
end

