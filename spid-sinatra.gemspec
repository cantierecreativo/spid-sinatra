lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spid/sinatra/version"

Gem::Specification.new do |spec|
  spec.name          = "spid-sinatra"
  spec.version       = Spid::Sinatra::VERSION
  spec.authors       = ["David Librera"]
  spec.email         = ["davidlibrera@gmail.com"]

  spec.summary       = %q{Sinatra wrapper around spid-ruby}
  spec.description   = %q{Sinatra wrapper around spid-ruby}
  spec.homepage      = "https://github.com/cantierecreativo/spid-sinatra"
  spec.license       = "BSD-3"
  spec.files      = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.metadata    = {
    "homepage_uri" => "https://github.com/cantierecreativo/spid-sinatra",
    "changelog_uri" => "https://github.com/cantierecreativo/spid-sinatra/blob/master/CHANGELOG.md",
    "source_code_uri" => "https://github.com/cantierecreativo/spid-sinatra/",
    "bug_tracker_uri" => "https://github.com/cantierecreativo/spid-sinatra/issues"
  }
  spec.required_ruby_version = ">= 2.3.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
