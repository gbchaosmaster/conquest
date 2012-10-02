require File.expand_path("../lib/conquest/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "conquest"
  gem.version = Conquest::VERSION

  gem.author = "Vinny Diehl"
  gem.email = "gbchaosmaster926@gmail.com"
  gem.homepage = "https://github.com/gbchaosmaster/conquest"

  gem.license = "MIT"

  gem.summary = "Fetches and compiles Pokemon Conquest hex data."
  gem.description = "Gathers data from Serebii's Pokemon Conquest page and " +
                    "uses it to generate ARDS codes."

  gem.bindir = "bin"
  gem.executables = "conquest"

  gem.require_paths = %w[lib]
  gem.files = Dir["lib/**/*"] + %w[LICENSE Rakefile README.md conquest.gemspec]

  gem.add_dependency "nokogiri", "~> 1.5"
  gem.add_dependency "nutella", "~> 0.4"
end
