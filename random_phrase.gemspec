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
  s.description = %q{This gem provides the ability to generate a random phrase from a customizable word list via word length and regexp matching.}

  s.rubyforge_project = "random_phrase"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
	s.add_dependency "activesupport", "~>3"
	s.add_development_dependency "require_all"
	s.add_development_dependency "ruby-debug19"
	s.add_development_dependency "rspec", "~>2"
end
