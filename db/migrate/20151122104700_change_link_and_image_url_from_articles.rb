class ChangeLinkAndImageUrlFromArticles < ActiveRecord::Migration
  def change
    change_column :articles, :link, :text
    change_column :articles, :image_url, :text
  end
end
