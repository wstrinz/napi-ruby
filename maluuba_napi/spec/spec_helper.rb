require 'rspec'
require 'maluuba_napi'

def assert_intepret(response, category, action)
  response[:category].should eql category
  response[:action].should eql action
end