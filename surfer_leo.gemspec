# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'surfer_leo/version'

Gem::Specification.new do |spec|
  spec.name          = "surfer_leo"
  spec.version       = SurferLeo::VERSION
  spec.authors       = ["Earl St Sauver"]
  spec.email         = ["estsauver@gmail.com"]
  spec.summary       = %q{Provide simple csrf protection for rack websites}
  spec.description   = %q{Does configurable host checking based on origin and referrer headers.}
  spec.homepage      = "https://github.com/TheClimateCorporation/surfer_leo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rack"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2"
  spec.add_development_dependency "yard", "~> 0"
  spec.add_development_dependency "pry"

end
