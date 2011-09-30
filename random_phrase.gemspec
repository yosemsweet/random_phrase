# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "random_phrase/version"

Gem::Specification.new do |s|
  s.name        = "random_phrase"
  s.version     = RandomPhrase::VERSION
  s.authors     = ["Yosem Sweet"]
  s.email       = ["yosem.sweet@suite101.com"]
  s.homepage    = "https://github.com/yosemsweet/random_phrase"
  s.summary     = %q{Generate a simple random phrase}
  s.description = %q{This gem provides random phrase functionality and extends Array with a random .pick}

  s.rubyforge_project = "random_phrase"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
