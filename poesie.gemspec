lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'poesie/version'

Gem::Specification.new do |s|
  s.name        = 'poesie'
  s.version     = Poesie::VERSION
  s.summary     = "Automate and post-process the export of POEditor strings"
  s.description = "This script automates the export of POEditor strings to iOS and Android files"
  s.authors     = ["Olivier Halligon", "NijiDigital"]
  s.homepage    = 'https://github.com/NijiDigital/poesie'
  s.email       = 'devs-ios@niji.fr'
  s.license     = 'Apache-2.0'

  s.files       = `git ls-files lib bin -z`.split("\x0")
  s.required_ruby_version = '>= 2.0.0'
  s.executables << 'poesie'

  s.add_dependency 'net', '~> 0.3'
  s.add_dependency 'activesupport', '~>4.2'
  s.add_dependency 'builder', '~> 3.0'
end
