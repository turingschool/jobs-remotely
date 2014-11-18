require 'minitest/autorun'
require 'minitest/pride'
require './lib/jobs/remotely/fetcher'

class FetcherTest < Minitest::Test
  def test_it_exists
    assert Jobs::Remotely::Fetcher
  end

  def test_it_fetches_an_rss_feed
    fetcher = Jobs::Remotely::Fetcher.new
    jobs = fetcher.fetch_file('./test/fixtures/jobs.rss')
    assert jobs.count > 5, "There are at least five jobs in the fixture file"
  end

  def test_it_fetches_jobs_from_a_file
    fetcher = Jobs::Remotely::Fetcher.new
    jobs = fetcher.fetch_file('./test/fixtures/jobs.rss')
    sample = jobs.first
    assert_equal "Kaleo Software: Senior Software Engineer", sample.title
    assert sample.description.include?("looking for a Senior Software Engineer")
    assert_equal "https://weworkremotely.com/jobs/1080", sample.source_url

  end
end
