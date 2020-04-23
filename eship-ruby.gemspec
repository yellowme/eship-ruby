
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "eship/version"

Gem::Specification.new do |spec|
  spec.name          = "eship-ruby"
  spec.version       = Eship::VERSION
  spec.authors       = ["Yellowme"]
  spec.email         = ["hola@yellowme.mx"]

  spec.summary       = %q{Eship-ruby es una gema para interactuar con la API de segmail proporciona a través del servicio de paqueterías Eship.}
  spec.description   = %q{con Eship-ruby es posible generar una orden en el `dashboard` del servicio sin tener que ingresar los datos del remitente y el destinatario de manera manual.}
  spec.homepage      = "https://yellowme.mx"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'dry-validation', '~> 1.3'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'app_version_tasks'
  spec.add_development_dependency "rubocop-airbnb", "~> 3.0"
  spec.add_development_dependency "rubocop-rspec", "~> 1.30"
  spec.add_development_dependency "simplecov", "~> 0.17"
end
