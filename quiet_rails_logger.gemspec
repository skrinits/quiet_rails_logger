$:.push File.expand_path("../lib", __FILE__)

require "quiet_rails_logger/version"

Gem::Specification.new do |s|
  s.name        = "quiet_rails_logger"
  s.version     = QuietRailsLogger::VERSION
  s.authors     = ["skrinits"]
  s.email       = ["110100reg@gmail.com"]
  s.homepage    = "https://github.com/skrinits/quiet_rails_logger"
  s.summary     = "Quiet rails logger's messages with an INFO level"
  s.description = "Stop logging of need not messages to log with an INFO level in production and staging enviroments"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0"
end
