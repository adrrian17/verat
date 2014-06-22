# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'verat/version'

Gem::Specification.new do |spec|
  spec.name          = "verat"
  spec.version       = Verat::VERSION
  spec.authors       = ["Adrian Ayala"]
  spec.email         = ["adrian.ayala17@gmail.com"]
  spec.description   = %q{git-flow CLI manager}
  spec.summary       = %q{verat is a CLI tool to manage with ease git-flow branching model}
  spec.homepage      = "https://github.com/adrrian17/verat"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "git", "~> 1.2.7"
  spec.add_runtime_dependency "mercenary", "~> 0.3.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
