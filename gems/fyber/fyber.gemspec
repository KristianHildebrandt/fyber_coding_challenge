# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fyber/version'

Gem::Specification.new do |spec|
  spec.name          = "fyber"
  spec.version       = Fyber::VERSION
  spec.authors       = ["Kristian Hildebrandt"]
  spec.email         = ["hildebrandt.kristian@gmail.com"]

  spec.summary       = %q{Interact with the Fyber api.}
  spec.description   = %q{This is an api wrapper to interact with the Fyber api.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13.7"
  spec.add_dependency "addressable", "~> 2.3.8"
  spec.add_dependency "dotenv", "~> 2.0.2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "vcr", "~> 2.9.3"
  spec.add_development_dependency "webmock", "~> 1.21.0"
  spec.add_development_dependency "timecop", "~> 0.8.0"
  spec.add_development_dependency "simplecov", "~> 0.10.0"
end
