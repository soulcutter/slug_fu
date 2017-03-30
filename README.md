# SlugFu

Yet Another gem for generating slug strings suitable for URLs (or whatever your slug business may be).

**What makes this one different?** This gives you tools for ensuring the uniqueness of your slugs,
and if your slug is not unique it allows you to plug in different strategies for generating unique slugs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slug_fu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slug_fu

## Usage

```ruby
include SlugFu

SlugFu(string) # doesn't need to check uniqueness, just make a slug string

SlugFu(string, context: %w(one two)) # generated slug will unique as far as `context.include?(slug)` is concerned

class NamingStrategy
  def initialize(str)
    @str = str
  end

  def next
    @next = @next.nil? ? @str || @next + "-"
  end
end
SlugFu("one", context: %w(one one-), naming_strategy: NamingStrategy) # Use a custom strategy for naming, calling #next until a unique name is found
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/soulcutter/slug_fu

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

