$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quiet_rails_logger/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quiet_rails_logger"
  s.version     = QuietRailsLogger::VERSION
  s.authors     = ["skrinits"]
  s.email       = ["110100reg@gmail.com"]
  s.homepage    = "https://github.com/skrinits"
  s.summary     = "Summary of QuietRailsLogger."
  s.description = "Description of QuietRailsLogger."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0"
end
