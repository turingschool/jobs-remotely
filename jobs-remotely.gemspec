# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jobs/remotely/version'

Gem::Specification.new do |spec|
  spec.name          = "jobs-remotely"
  spec.version       = Jobs::Remotely::VERSION
  spec.authors       = ["Jeff Casimir"]
  spec.email         = ["jeff@casimircreative.com"]
  spec.summary       = "A small gem to easily fetch jobs from WeWorkRemotely.com"
  spec.description   = "A small gem to easily fetch jobs from WeWorkRemotely.com"
  spec.homepage      = "https://github.com/turingschool/jobs-remotely"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
  spec.add_dependency 'feedjira'
end
