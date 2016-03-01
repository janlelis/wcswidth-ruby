# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/wcswidth/version"

Gem::Specification.new do |gem|
  gem.name          = "wcswidth"
  gem.version       = Wcswidth::VERSION
  gem.summary       = "FFI bindings to libc's wcswidth()"
  gem.description   = "Determine terminal display width (columns) of Ruby strings via FFI bindings to libc's wcswidth() function"
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["mail@janlelis.de"]
  gem.homepage      = "https://github.com/janlelis/wcswidth-ruby"
  gem.license       = "MIT"

  gem.files         = Dir["{**/}{.*,*}"].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = "~> 2.0"
  gem.add_dependency 'ffi', "~> 1.9"
  gem.add_development_dependency 'rspec', "~> 3.4"
end
