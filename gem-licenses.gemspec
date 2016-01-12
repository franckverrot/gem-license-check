# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "gem-licenses"
  spec.version       = "1.0.0"
  spec.authors       = ["Franck Verrot"]
  spec.email         = ["franck@verrot.fr"]

  spec.summary       = %q{License reporter and checker for your Ruby projects}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/franckverrot/gem-licenses"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
