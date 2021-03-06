# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wl/version'

Gem::Specification.new do |spec|
  spec.name          = "wl"
  spec.version       = Wl::VERSION
  spec.authors       = ["Abhi Hiremagalur"]
  spec.email         = ["abhijit@hiremaga.com"]
  spec.description   = %q{`wl` is an unofficial Ruby client and command line interface for the truly awesome Wunderlist}
  spec.summary       = %q{`wl` is an unofficial Ruby client and command line interface for the truly awesome Wunderlist}
  spec.homepage      = "http://github.com/hiremaga/wl"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "highline"
  spec.add_dependency "api_smith"
  spec.add_dependency "shy"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock", "< 1.10"
  spec.add_development_dependency "vcr"
end
