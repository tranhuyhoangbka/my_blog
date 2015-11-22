require "rufus-scheduler"

scheduler = Rufus::Scheduler::singleton(:max_work_threads => 100)

scheduler.every "8m" do
  Settings.rss_urls.to_h.values.each do |url|
    Post.create_daily_posts! url
  end
end
