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
        build_jobs(parser, options)
      end

      def fetch_url(url, options = {})
        parser = Feedjira::Feed.fetch_and_parse([url], options = {})
        build_jobs(parser.first, options)
      end

      def build_jobs(parser, options)
        jobs = parser.entries.collect{|entry| Job.new(entry)}

        if options[:since]
          jobs = jobs.select{|entry| entry.posted_on >= options[:since]}
        end

        return jobs
      end
    end
  end
end
