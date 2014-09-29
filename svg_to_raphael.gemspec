# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'svg_to_raphael/version'

Gem::Specification.new do |spec|
  spec.name          = "svg_to_raphael"
  spec.version       = SvgToRaphael::VERSION
  spec.authors       = ["Gerardo Ortega"]
  spec.email         = ["geraldavid7@gmail.com"]
  spec.summary       = %q{A simple parser to converter SVG to Raphael.}
  spec.description   = %q{A simple converter to SVG to Raphael format.}
  spec.homepage      = "https://github.com/KakaoMedia/svg_to_raphael"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "1.6.3.1"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency "rake"
end
