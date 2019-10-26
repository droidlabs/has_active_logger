# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

require 'has_active_logger/version'

Gem::Specification.new do |spec|
  spec.name          = "has_active_logger"
  spec.version       = HasActiveLogger::VERSION
  spec.authors       = ["Droidlabs"]
  spec.description   = "HasActiveLogger"
  spec.summary       = "HasActiveLogger"
  spec.license       = "MIT"

  spec.files = Dir["lib/**/*"] + ["LICENSE.txt", "Rakefile", "README.md"]
  spec.test_files = Dir["spec/**/*"]

  spec.add_dependency "yell", '~> 2.2'
  spec.add_dependency "json"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "rspec"
end
