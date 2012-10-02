require File.expand_path("../lib/conquest/gtk/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "conquest-gtk"
  gem.version = Conquest::GUI_VERSION

  gem.author = "Vinny Diehl"
  gem.email = "gbchaosmaster926@gmail.com"
  gem.homepage = "https://github.com/gbchaosmaster/conquest"

  gem.license = "MIT"

  gem.summary = "GUI for the Conquest tool."
  gem.description = "A graphical front-end to the conquest gem."

  gem.require_paths = %w[lib]
  gem.files = Dir["lib/**/*"] + %w[
    LICENSE Rakefile README.md conquest-gtk.gemspec
  ]

  gem.add_dependency "conquest", "~> 0.0"
  gem.add_dependency "clipboard", "~> 1.0"
  gem.add_dependency "gtk2", "~> 1.1"
end
