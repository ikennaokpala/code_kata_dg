# -*- encoding: utf-8 -*-
require File.expand_path('../lib/coding_test_dg/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ikenna Okpala"]
  gem.email         = ["ikennaokpala@gmail.com"]
  gem.description   = %q{Another coding kata}
  gem.summary       = %q{Coding test!!}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "coding_test_dg"
  gem.require_paths = ["lib"]
  gem.version       = CodingTestDg::VERSION

  gem.add_dependency "rspec"
end
