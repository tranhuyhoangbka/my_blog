class Rss::Google_news
  attr_reader :url

  LIMIT = 5

  def initialize url
    @url = url
  end

  def fetch_data
    Feedjira::Feed.fetch_and_parse(url).entries.first LIMIT
  end
end
