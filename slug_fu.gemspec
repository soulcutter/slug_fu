# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slug_fu/version'

Gem::Specification.new do |spec|
  spec.name          = "slug_fu"
  spec.version       = SlugFu::VERSION
  spec.authors       = ["Bradley Schaefer"]
  spec.email         = ["bradley.schaefer@gmail.com"]

  spec.summary       = %q{Yet another gem for creating slugs from arbitrary strings}
  spec.description   = %q{What sets this slug gem apart is its pluggable naming strategy and that it validates slug uniqueness}
  spec.homepage      = "https://www.github.com/soulcutter/slug_fu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
