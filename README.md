# DateUtils

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/date_utils`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'date_utils'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install date_utils

## Usage

method: month_end

example:
```ruby
Date.civil(2017, 9, 15).month_end #2017-09-30
```

method: month_begin
example:
```ruby
Date.civil(2017, 9, 15).month_begin #2017-09-01
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lkfken/date_utils.

