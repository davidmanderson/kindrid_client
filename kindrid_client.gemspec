# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kindrid_client/version'

Gem::Specification.new do |gem|
  gem.name          = "kindrid_client"
  gem.version       = KindridClient::VERSION
  gem.authors       = ["David Anderson"]
  gem.email         = ["davidmartinanderson@gmail.com"]
  gem.description   = %q{Client gem for the Kindrid service}
  gem.summary       = %q{Client gem for the Kindrid service}
  gem.homepage      = ""
  
  gem.add_runtime_dependency('rash', '~> 0.3')
  gem.add_runtime_dependency("faraday")
  gem.add_runtime_dependency('multi_json', '~> 1.0')

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
