
Gem::Specification.new do |s|
  s.name        = 'extended_dir'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = "small utility library for loading files in a priortized sort order"
  s.description = "small utility library for loading files in a priortized sort order"
  s.authors     = ["Sean Gregory"]
  s.email       = 'sean.christopher.gregory@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
  s.homepage    = 'https://rubygems.org/gems/extended_dir'
  s.metadata    = { "source_code_uri" => "https://github.com/skinnyjames/extended_dir" }
  s.add_development_dependency 'rspec'
end