$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erp/giafordhcm/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erp_giafordhcm"
  s.version     = Erp::Giafordhcm::VERSION
  s.authors     = ["Ton Hung Nguyen"]
  s.email       = ["hungnt@hoangkhang.com.vn"]
  s.homepage    = "http://globalnaturesoft.com/"
  s.summary     = "GiaFordHCM."
  s.description = "GiaFordHCM."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "erp_core"
  s.add_dependency "deface"
end
