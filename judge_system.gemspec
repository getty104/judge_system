lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'judge_system/version'

Gem::Specification.new do |spec|
  spec.name          = 'judge_system'
  spec.version       = JudgeSystem::VERSION
  spec.authors       = ['getty104']
  spec.email         = ['hayabusatoshihumi@gmail.com']

  spec.summary       = 'This is a judge system for online judge '
  spec.description   = "This is a judge system for online judge. \nThis gem work on the wandbox api."
  spec.homepage      = 'https://github.com/getty104/judge_system'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # raise "RubyGems 2.0 or newer is required to protect against " \
  # {}"public gem pushes."
  # end
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'ffi'
  spec.add_dependency 'rbzip2'
  spec.add_development_dependency 'bundler', '~> 1.17.1'
  spec.add_development_dependency 'rake',    '~> 12.0'
  spec.add_development_dependency 'rspec',   '~> 3.4'
  spec.add_development_dependency 'rubocop', '~> 0.60.0'
end
