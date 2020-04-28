# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eship/version'

Gem::Specification.new do |spec|
  spec.name          = 'eship-ruby'
  spec.version       = Eship::VERSION
  spec.authors       = ['Yellowme']
  spec.email         = ['hola@yellowme.mx']

  spec.summary       = 'Eship-ruby provides a layer to interact with the Segmail API throug the Eship parcels service'
  spec.description   = 'with Eship-ruby you can generate an order in the `dashboard` without the need to enter all the data manually.'
  spec.homepage      = 'https://yellowme.mx'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  
  spec.add_dependency 'httparty', '~> 0.16.0'

  spec.add_development_dependency 'app_version_tasks'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop-airbnb', '~> 3.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.30'
  spec.add_development_dependency 'simplecov', '~> 0.17'
  spec.add_development_dependency 'webmock', '~> 3.7'
end
