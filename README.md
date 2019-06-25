# RailsMallocTrim

Drop-in library for RAILS app to save some memory.

Gem will call `malloc_trim` after every GC run. This gem solves the problem with the minimum possible effort.
It will check if `malloc_trim` is available and then enables trimming along with loading your Rails app

## Installation

Just put it in your Gemfile:

```ruby
  gem 'rails_malloc_trim', git: 'https://github.com/noma4i/rails_malloc_trim' 
```

Done!

## Impact

  - 99th percentile performance is slightly impacted
  - CPU is very slightly higher

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

### Based on idea from

* https://www.joyfulbikeshedding.com/blog/2019-03-14-what-causes-ruby-memory-bloat.html
* https://github.com/tessi/malloc_trim
