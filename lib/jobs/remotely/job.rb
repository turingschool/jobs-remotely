module Jobs
  module Remotely
    class Job
      attr_accessor :title, :description, :source_url

      def initialize(parser)
        @title = parser.title
        @description = parser.summary
        @source_url = parser.url
      end
    end
  end
end
