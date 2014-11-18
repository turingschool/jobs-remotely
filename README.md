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

Or, scoped to only those jobs newere than a certain date:

```
> require 'jobs-remotely'
true
> fetcher = Jobs::Remotely::Fetcher.new
#<Jobs::Remotely::Fetcher ...>
> start_date = Date.today - 2
> fetcher.fetch_file('./test/fixtures/jobs.rss', :since => start_date)
[#<Jobs::Remotely::Job ...>]
```

Results will include any posts on the `start_date`.

## Contributing

1. Fork it ( https://github.com/turingschool/jobs-remotely/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
