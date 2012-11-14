require 'rspec'
require 'maluuba_napi'
require 'maluuba_napi/categories'
require 'maluuba_napi/actions'

def assert_intepret(response, category, action)
  response[:category].should eql category
  response[:action].should eql action
  MaluubaNapi::Categories.valid?(category).should eql true
  MaluubaNapi::Actions.valid?(action).should eql true
end