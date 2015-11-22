class AddRssColumnsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :category, :string
    add_column :articles, :entry_id, :string
    add_column :articles, :published_at, :datetime
    add_column :articles, :link, :string
    add_column :articles, :image_url, :string
    add_column :articles, :author, :string
    add_column :articles, :short_content, :text
    add_column :articles, :post_type, :integer
    add_index :articles, :entry_id, unique: true
  end
end
