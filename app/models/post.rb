class Post < Article
  include RailsAdmin::PostAdmin

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories

  POST_ATTR = %i(category entry_id published_at title link image_url author
    short_content)

  paginates_per 10

  enum post_type: [:normal, :daily]

  has_attached_file :image, :styles => {
      :thumb => "140x140#",
      :small  => "200x200#",
      :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  #validates :image, attachment_presence: true

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  class << self
    def create_daily_posts! url
      posts = Rss::Google_news.new(url).fetch_data
      return [] unless posts.present?
      posts.each do |post|
        post_data = Rss::ExtractGoogleEntry.new post
        create_if_not_exist! post_data
      end
    end

    private
    def hash_t post_data
      attributes = Hash.new
      POST_ATTR.each do |attr|
        attributes[attr] = post_data.send attr
      end
      attributes.merge post_type: 1
    end

    def create_if_not_exist! post_data
      return if(Post.find_by_entry_id(post_data.entry_id) || !Category.exists?(name: post_data.category))
      Category.find_by_name(post_data.category).posts << Post.create(hash_t(post_data))
    end
  end
end
