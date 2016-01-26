# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orange_push_sms/version'

Gem::Specification.new do |spec|
  spec.name          = 'orange_push_sms'
  spec.version       = OrangePushSMS::VERSION
  spec.authors       = ['Mustafa Sall']
  spec.email         = ['taphasall@gmail.com']
  spec.summary       = "Une gem pour envoyer des sms via l'api d'orange sénégal"
  spec.description   = ""
  spec.homepage      = 'https://github.com/divinwind/orange_push_sms'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 2.99'
  spec.add_runtime_dependency 'http', '~> 1.0'
  spec.add_runtime_dependency 'nokogiri', '~> 1.6'
end
