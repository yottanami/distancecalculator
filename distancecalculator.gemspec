
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "distancecalculator/version"

Gem::Specification.new do |spec|
  spec.name          = "distancecalculator"
  spec.version       = Distancecalculator::VERSION
  spec.authors       = ["yottanami"]
  spec.email         = ["yottanami@gnu.org"]

  spec.summary       = %q{Distance Calculator}
  spec.description   = %q{Distance Calculator}
  spec.homepage      = "http://yottanami.com"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency "thor"
  spec.add_dependency "rantly"
end
