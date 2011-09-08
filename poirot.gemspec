# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "poirot/version"

Gem::Specification.new do |s|
  s.name        = "poirot"
  s.version     = Poirot::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Oliver Nightingale", "Mark Evans", "Theo Cushion"]
  s.email       = ["oliver.nightingale1@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/poirot"
  s.summary     = %q{mustaches}
  s.description = %q{Use mustaches from Rails views and also make available to Javascript via Rails 3.1 asset pipeline}

  s.add_dependency('rails', '~> 3.1')
  s.add_dependency('mustache')
  s.add_runtime_dependency('tilt')

  s.rubyforge_project = "poirot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
