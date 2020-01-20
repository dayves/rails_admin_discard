$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "rails_admin_discard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "rails_admin_discard"
  spec.version     = RailsAdminDiscard::VERSION
  spec.authors     = ["Dayves"]
  spec.email       = ["dayves.dias@gmail.com"]
  spec.homepage    = "https://github.com/dayves/rails_admin_discard"
  spec.summary     = "A poor implementation of custom actions of rails admin to use discard gem."
  spec.description = "A poor implementation of custom actions of rails admin to use discard gem."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"
  spec.add_dependency "discard", "~> 1.0"
end
