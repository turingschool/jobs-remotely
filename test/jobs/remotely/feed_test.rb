require 'minitest/autorun'
require 'minitest/pride'
require './lib/jobs/remotely/feed'

class FeedTest < Minitest::Test
  def test_it_exists
    assert Jobs::Remotely::Feed
  end

  def test_it_provides_the_programming_jobs_rss_url
    assert Jobs::Remotely::Feed.for(:programming).include?(".rss")
  end

  def test_it_complains_when_a_feed_is_not_found
    assert_raises Jobs::Remotely::FeedNotFound do
      Jobs::Remotely::Feed.for(:blahblah)
    end
  end

  def test_it_provides_all_feed_urls_in_a_collection
    assert Jobs::Remotely::Feed.all.count > 2
  end
end
