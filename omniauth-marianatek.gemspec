
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-marianatek/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-marianatek'
  spec.version       = OmniauthMarianatek::VERSION
  spec.authors       = ['Jesse Cotton']
  spec.email         = ['jcotton@bitlancer.com']

  spec.summary       = 'OmniAuth strategy for Mariana Tek'
  spec.description   = 'OmniAuth strategy for OAuth 2 against Mariana Tek'
  spec.homepage      = 'https://github.com/bitlancer/omniauth-marianatek' 
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.7.0'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
end
