require 'byebug'

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vince/version"

Gem::Specification.new do |spec|

  spec.name        = 'vince'
  spec.version     = Vince::VERSION
  spec.date        = '2017-10-12'
  spec.summary     = "Vince!"
  spec.description = "Rently AWS Tool"
  spec.authors     = ["Vincent Chen"]
  spec.email       = 'vincent@rently.com'
  spec.files       = ["lib/vince.rb"]
  spec.license     = 'MIT'
  spec.homepage    = "https://github.com/jlchenwenbo/vince.git"

  spec.add_dependency 'thor', '~> 0.20.0'
  spec.add_dependency 'hashie', '~> 3.5', '>= 3.5.6'
  spec.add_dependency 'colorize', '~> 0.8.1'
  spec.add_dependency 'deep_merge', '~> 1.1', '>= 1.1.1'
  spec.add_dependency 'aws-sdk', '~> 3.0', '>= 3.0.1'
  spec.add_dependency 'plissken', '~> 1.2'

  spec.add_development_dependency 'bundler', '~> 1.15', '>= 1.15.4'
  spec.add_development_dependency 'byebug', '~> 9.1'
  spec.add_development_dependency 'rake', '~> 12.1'
  spec.add_development_dependency 'rspec', '~> 3.6'

end