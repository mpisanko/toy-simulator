
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toy_simulator/version'

Gem::Specification.new do |spec|
  spec.name          = 'toy_simulator'
  spec.version       = ToySimulator::VERSION
  spec.authors       = ['Michal Pisanko']
  spec.email         = ['mpisanko@gmail.com']
  spec.description   = 'Toy Robot Simulator'
  spec.summary       = 'Toy Robot Simulator'
  spec.homepage      = 'https://bitbucket.org/mpisanko/toy-simulator'
  spec.license       = ''

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ['runner'] #spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', "~> 1.6"
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
