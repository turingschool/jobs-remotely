require 'bundler/setup'
require 'feedjira'
require 'pry'
require_relative 'job'

module Jobs
  module Remotely
    class Fetcher
      def fetch_file(path, options = {})
        content = File.read(path)
        parser = Feedjira::Feed.parse(content)
        entries = parser.entries.collect{|entry| Job.new(entry)}

        if options[:since]
          entries = entries.select{|entry| entry.posted_on >= options[:since]}
        end

        return entries
      end
    end
  end
end
