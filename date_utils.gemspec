lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date_utils/version'

Gem::Specification.new do |spec|
  spec.name          = 'date_utils'
  spec.version       = DateUtils::VERSION
  spec.authors       = ['Kenneth Leung']
  spec.email         = ['kenneth@leungs.us']

  spec.summary       = 'Collection of Date/Time/DateTime utilities.'
  spec.description   = 'Collection of Date/Time/DateTime utilities.'
  spec.homepage      = 'https://github.com/lkfken/date_utils'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://github.com/lkfken/date_utils'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'ruby-lsp'
  spec.add_development_dependency 'pry'
end
