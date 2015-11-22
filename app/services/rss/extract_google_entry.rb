class Rss::ExtractGoogleEntry
  require 'nokogiri'

  attr_reader :entry, :summary, :doc

  def initialize entry
    @entry = entry
    @summary = summary
    @doc = doc
  end

  def category
    entry.categories[0]
  end

  def entry_id
    entry.entry_id
  end

  def published_at
    entry.published
  end

  def title
    doc.css("div.lh a")[0].text
  end

  def link
    doc.css("div.lh a")[0]["href"]
  end

  def image_url
    doc.css("img")[0]["src"].gsub("//", "")
  end

  def author
    doc.css("a font").text
  end

  def short_content
    doc.css("div.lh font")[2].text
  end

  private
  def summary
    entry.summary
  end

  def doc
    Nokogiri::HTML summary
  end
end
