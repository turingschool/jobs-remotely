require 'bundler/setup'
require 'feedjira'
require 'pry'
require_relative 'job'

module Jobs
  module Remotely
    class Fetcher
      def fetch_file(path)
        content = File.read(path)
        parser = Feedjira::Feed.parse(content)
        parser.entries.collect{|entry| Job.new(entry)}
      end
    end
  end
end
