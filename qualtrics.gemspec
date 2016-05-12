# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qualtrics/version'

Gem::Specification.new do |spec|
  spec.name          = "qualtrics"
  spec.version       = Qualtrics::VERSION
  spec.authors       = ["Nick Hurst"]
  spec.email         = ["hurst.178@osu.edu"]

  spec.summary       = "Qualtrics API Wrapper"
  spec.homepage      = "https://www.github.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir["{lib}/**/*.rb"]
  # spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rubyzip", "~> 1.2"
  spec.add_dependency "faraday", "~> 0.9.2"
  # spec.add_dependency "resource_kit", "~> 0.1.5"
  spec.add_dependency "kartograph", "~> 0.2.4"
  spec.add_dependency "virtus", "~> 1.0"
  spec.add_dependency "activesupport", "~> 4.2"
  spec.add_dependency "smarter_csv", "~> 1.1"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'webmock', '~> 1.18'
  spec.add_development_dependency 'pry'
end
