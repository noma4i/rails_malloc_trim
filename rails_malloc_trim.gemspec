lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'rails_malloc_trim'
  s.version       = '0.2'
  s.authors       = ['Alexander Tsirel']
  s.email         = ['noma4i@gmail.com']

  s.summary       = 'Autofix Ruby GC for Rails projects'
  s.description   = <<-DESCRIPTION
    Call malloc_trim(0) on GC
    Impact:
      - 99th percentile performance is slightly impacted.
      - CPU is very slightly higher

    Inspired by Philipp Tessenow's malloc_trim gem
  DESCRIPTION
  s.homepage      = 'https://github.com/noma4i/rails_malloc_trim'
  s.license       = 'MIT'

  s.require_paths = ['lib']
  s.extensions    = ['ext/rails_malloc_trim/extconf.rb']

  s.required_ruby_version = '> 2.1'
  s.add_dependency 'rails', '>= 4.0'

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rake-compiler'
end
