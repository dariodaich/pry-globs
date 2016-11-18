# coding: utf-8

Gem::Specification.new do |spec|
  spec.name     = 'pry-globs'
  spec.version  = '1.0.0'
  spec.author   = 'Dario Daic'
  spec.email    = 'dario@daic.me'

  spec.summary  = 'Easily decipher meaning of Ruby\'s notoriously cryptic global variables and constants.'
  spec.homepage = 'https://github.com/dariodaic/pry-globs'
  spec.license  = 'MIT'
  spec.post_install_message =
    "Hidden meaning of Ruby's cryptic global variables and constants revealed.\n\nThank you for installing pry-globs!"

  spec.files = Dir['lib/pry-globs.rb', 'lib/pry-globs/*', 'lib/support/*']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0p0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rspec',   '~> 3.0'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'pry',     '~> 0.10'
end
