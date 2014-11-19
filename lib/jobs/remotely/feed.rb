module Jobs
  module Remotely
    class Feed
      def self.for(name)
        all[name] || raise(FeedNotFound.new("#{name} is not a known feed"))
      end

      def self.all
        {
          :programming => "https://weworkremotely.com/categories/2/jobs.rss",
          :system_administration => "https://weworkremotely.com/categories/6/jobs.rss",
          :design => "https://weworkremotely.com/categories/1/jobs.rss",
          :business => "https://weworkremotely.com/categories/3/jobs.rss",
          :copywriter => "https://weworkremotely.com/categories/5/jobs.rss",
          :miscellaneous => "https://weworkremotely.com/categories/4/jobs.rss",
          :customer_service => "https://weworkremotely.com/categories/7/jobs.rss"
        }
      end
    end

    class FeedNotFound < RuntimeError
    end
  end
end
