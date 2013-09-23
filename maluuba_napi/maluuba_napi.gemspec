# -*- encoding: utf-8 -*-
require File.expand_path('../lib/maluuba_napi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew McNamara"]
  gem.email         = ["andrew.mcnamara@maluuba.com"]
  gem.description   = %q{MaluubaNapi allows you to easily consume Maluuba's NLP API}
  gem.summary       = %q{MaluubaNapi is a simple wrapper for consuming the Maluuba NLP API}
  gem.homepage      = "http://github.com/Maluuba/napi-ruby"

  gem.add_dependency 'httparty', '~> 0.11.0'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'yard'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "maluuba_napi"
  gem.require_paths = ["lib"]
  gem.version       = MaluubaNapi::VERSION
end
