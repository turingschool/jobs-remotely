require 'minitest/autorun'
require 'minitest/pride'
require './lib/jobs/remotely/fetcher'
require 'webmock'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

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

  def test_it_fetches_jobs_scoped_by_start_date
    fetcher = Jobs::Remotely::Fetcher.new
    start_on = Date.parse("2014-11-14")
    jobs = fetcher.fetch_file('./test/fixtures/jobs.rss', :since => start_on)
    assert_equal 5, jobs.count
    jobs.each do |job|
      assert job.posted_on >= start_on
    end
  end

  def test_it_fetches_jobs_from_a_url
    VCR.use_cassette('jobs_2_from_url') do
      fetcher = Jobs::Remotely::Fetcher.new
      jobs = fetcher.fetch_url('https://weworkremotely.com/categories/2/jobs.rss')
      sample = jobs.first
      assert_equal "Kaleo Software: Senior Software Engineer", sample.title
      assert sample.description.include?("looking for a Senior Software Engineer")
      assert_equal "https://weworkremotely.com/jobs/1080", sample.source_url
    end
  end

  def test_it_fetches_jobs_from_a_url_scoped_by_start_date
    VCR.use_cassette('jobs_2_from_url_scoped_by_date') do
      fetcher = Jobs::Remotely::Fetcher.new
      start_on = Date.parse("2014-11-14")
      jobs = fetcher.fetch_url('https://weworkremotely.com/categories/2/jobs.rss', :since => start_on)
      assert_equal 5, jobs.count
      jobs.each do |job|
        assert job.posted_on >= start_on
      end
    end
  end
end
