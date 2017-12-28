# -*- encoding: utf-8 -*-

require File.expand_path('../lib/psymine/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "psymine"
  gem.version       = Psymine::VERSION
  gem.summary       = %q{Lightweight interface to the Redmine API}
  gem.description   = %q{A lightweight interface to the Redmine API}
  gem.license       = "GPLv3.0"
  gem.authors       = ["psyomn"]
  gem.email         = "lethaljellybean@gmail.com"
  gem.homepage      = "https://rubygems.org/gems/psymine"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
end
