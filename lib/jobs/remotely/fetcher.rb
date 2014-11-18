require 'bundler/setup'
require 'feedjira'
require 'pry'
require 'faraday'
require_relative 'job'

module Jobs
  module Remotely
    class Fetcher
      def fetch_file(path, options = {})
        content = File.read(path)
        entries = Feedjira::Feed.parse(content).entries
        build_jobs(entries, options)
      end

      def fetch_url(url, options = {})
        content = Faraday.get(url).body
        entries = Feedjira::Feed.parse(content).entries
        build_jobs(entries, options)
      end

      def build_jobs(entries, options)
        jobs = entries.collect{|entry| Job.new(entry)}

        if options[:since]
          jobs = jobs.select{|entry| entry.posted_on >= options[:since]}
        end

        return jobs
      end
    end
  end
end
