class AddVideoTypeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :video_type, :integer
  end
end
