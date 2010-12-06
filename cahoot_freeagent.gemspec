# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cahoot_freeagent/version"

Gem::Specification.new do |s|
  s.name        = "cahoot_freeagent"
  s.version     = CahootFreeagent::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["George Ornbo"]
  s.email       = ["george@shapeshed.com"]
  s.homepage    = ""
  s.summary     = %q{Scrapes cahoot HTML to Freeagent compatible CSV}
  s.description = %q{Cahoot don't do exportable statements so this does}

  s.rubyforge_project = "cahoot_freeagent"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "thor"
  s.add_dependency "fastercsv"
end
