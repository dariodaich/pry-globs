# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "pry-globs"
  spec.version       = "0.1.0"
  spec.authors       = ["dariodaic"]
  spec.email         = ["dariodaic5.1@gmail.com"]
  spec.homepage      = "https://github.com/dariodaic/pry-globs"

  spec.summary       = "Pry plugin for describing global variables."
  spec.license       = "MIT"

  spec.files         = Dir["lib/pry-globs.rb"]
  spec.files         += Dir["lib/pry-globs/*"]

  spec.require_paths = ["lib"]
end
