module Jobs
  module Remotely
    class Job
      attr_accessor :title, :description, :source_url, :posted_on

      def initialize(entry)
        @title       = entry.title
        @description = entry.summary
        @source_url  = entry.url
        @posted_on   = entry.published.to_date
      end
    end
  end
end
