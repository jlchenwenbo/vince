require 'byebug'

debugger
lib = File.expand_path('../lib', __FILE__)

Gem::Specification.new do |spec|

  spec.name        = 'vince'
  spec.version     = '0.0.0'
  spec.date        = '2017-10-12'
  spec.summary     = "Vince!"
  spec.description = "Rently AWS Tool"
  spec.authors     = ["Vincent Chen"]
  spec.email       = 'vincent@rently.com'
  spec.files       = ["lib/vince.rb"]
  spec.license     = 'MIT'

  spec.add_dependency "thor"
  spec.add_dependency "hashie"
  spec.add_dependency "colorize"
  spec.add_dependency "deep_merge"
  spec.add_dependency "aws-sdk"
  spec.add_dependency "plissken"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

end