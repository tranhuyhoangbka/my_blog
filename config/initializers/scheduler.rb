require "rufus-scheduler"

scheduler = Rufus::Scheduler::singleton(:max_work_threads => 100)

scheduler.cron "0 8,15 * * *" do
  Settings.rss_urls.to_h.values.each do |url|
    Post.create_daily_posts! url
  end
end

scheduler.cron "1 0 * * 0" do
  Post.old_posts.destroy_all
end
