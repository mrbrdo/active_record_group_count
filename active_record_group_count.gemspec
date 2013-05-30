$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_record_group_count/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_record_group_count"
  s.version     = ActiveRecordGroupCount::VERSION
  s.authors     = ["Jan Berdajs"]
  s.email       = ["mrbrdo@gmail.com"]
  s.homepage    = "https://github.com/mrbrdo/active_record_group_count"
  s.summary     = "Efficient Rails group count if you need the summed up count instead of the hash."
  s.description = "Efficient Rails group count if you need the summed up count instead of the hash. Can be used with Kaminari to speed up total_pages and total_count."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/active_record_group_count/*_spec.rb"]

  s.add_dependency "rails", ">=3.1.0"

  s.add_development_dependency 'psych'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec', ">=2.11"
  s.add_development_dependency 'database_cleaner'
end
