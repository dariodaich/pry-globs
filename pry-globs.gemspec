# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'pry-globs'
  spec.version       = '0.1.1'
  spec.authors       = ['Dario Daic']
  spec.email         = 'dario@daic.me'
  spec.homepage      = 'https://github.com/dariodaic/pry-globs'

  spec.summary       = 'Pry plugin for describing global variables.'
  spec.license       = 'MIT'

  # FIXME: write this after tests. Write it in a more concise manner.
  spec.files         = Dir['lib/pry-globs.rb']
  spec.files         += Dir['lib/pry-globs/*']

  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0p0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
end
