# Jobs::Remotely

This library makes it easy to pull job listings from WeWorkRemotely.com

## Installation

Add this line to your application's Gemfile:

    gem 'jobs-remotely'

And then execute:

    $ bundle

## Usage

### Fetching a Single Job Feed

To fetch the jobs for a single category:

```ruby
require 'jobs-remotely'
fetcher = Jobs::Remotely::Fetcher.new
fetcher.fetch_url Jobs::Remotely::Feed.for(:programming)
```

Or, to fetch the all jobs grouped by category:

```ruby
require 'jobs-remotely'
fetcher = Jobs::Remotely::Fetcher.new
Jobs::Remotely::Feed.all.collect do |category, url|
  [category, fetcher.fetch_url(url)]
end
```

Or a single set of all jobs:

```ruby
require 'jobs-remotely'
fetcher = Jobs::Remotely::Fetcher.new
Jobs::Remotely::Feed.all.collect do |category, url|
  fetcher.fetch_url(url)
end.flatten
```

### Parsing RSS from a File

```
> require 'jobs-remotely'
true
> fetcher = Jobs::Remotely::Fetcher.new
#<Jobs::Remotely::Fetcher ...>
> fetcher.fetch_file('./test/fixtures/jobs.rss')
[#<Jobs::Remotely::Job ...>, #<Jobs::Remotely::Job ...>]
```

Or, scoped to only those jobs newer than a certain date:

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
