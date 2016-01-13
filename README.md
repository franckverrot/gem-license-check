# Gem::Licenses

This gem is a gem license reporter and checker.  It will make use of the
`Gemfile` located inside of your projects.

## Installation

Add this line to your application's Gemfile:

```ruby gem 'gem-licenses' ```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gem-licenses


## Usage

Simply run:

    $ gem licenses

    License name |  # of gems | Gems
             MIT |         42 | ...
             BSD |          3 | ...
             GPL |          2 | ...

A summary of the licenses in use (and their repartition) will be
reported.

`gem licenses` supports some options:

* `-license <file name>`: License file to use

Some gems will use custom licenses, this is why an exhaustive list can't
be provided with this gem.

### Licenses file

TODO

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake test` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.  To install
this gem onto your local machine, run `bundle exec rake install`.  To
release a new version, update the version number in
`gem-licenses.gemspec`, and then run `bundle exec rake release`, which
will create a git tag for the version, push git commits and tags, and
push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/franckverrot/gem-licenses.  This project is intended
to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the [Contributor
Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT). See LICENSE.txt for more
information.
