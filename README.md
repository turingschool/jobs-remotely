# Jobs::Remotely

This library makes it easy to pull job listings from WeWorkRemotely.com

## Installation

Add this line to your application's Gemfile:

    gem 'jobs-remotely'

And then execute:

    $ bundle

## Usage

### Parsing RSS from a File

```
> require 'jobs-remotely'
true
> fetcher = Jobs::Remotely::Fetcher.new
#<Jobs::Remotely::Fetcher ...>
> fetcher.fetch_file('./test/fixtures/jobs.rss')
[#<Jobs::Remotely::Job ...>, #<Jobs::Remotely::Job ...>]
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jobs-remotely/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
