# coding: utf-8

Gem::Specification.new do |spec|
  spec.name     = 'pry-globs'
  spec.version  = '1.0.0'

  spec.author   = 'Dario Daic'
  spec.email    = 'dario@daic.me'

  spec.summary  = 'Get definition of Ruby\'s cryptic global variables and constants within a Pry session.'
  spec.homepage = 'https://rubygems.org/gems/pry-globs'
  spec.license  = 'MIT'

  spec.files    = Dir['lib/pry-globs.rb']
  spec.files   += Dir['lib/pry-globs/*']
  spec.files   += Dir['lib/support/*']

  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0p0'
  spec.post_install_message = "Dive into hidden meaning of Ruby\'s global variables.\n\nNamaste!\n\n"

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rspec',   '~> 3.0'
  spec.add_development_dependency 'pry',     '~> 0.10'
end
