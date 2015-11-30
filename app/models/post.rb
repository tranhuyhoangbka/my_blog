class Post < Article
  include RailsAdmin::PostAdmin

  before_save :set_post_type_default

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories

  POST_ATTR = %i(category entry_id published_at title link image_url author
    short_content)
  OLD_TIME = 6.days.ago

  paginates_per Settings.limit.posts

  enum post_type: [:normal, :daily]

  has_attached_file(:image,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'private',
    :path => "nice_images/:class/:attachment/:id_partition/:style/:filename",
    :styles => {
      :thumb => "140x140#",
      :small  => "300x300#",
      :medium => "500x500>" })
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  #validates :image, attachment_presence: true

  attr_accessor :delete_image

  before_validation { self.image.clear if self.delete_image == '1' }

  scope :old_posts, ->{where("published_at < ?", OLD_TIME)}

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

  private
  def set_post_type_default
    if published_at.nil? && post_type.nil?
      self.post_type = "normal"
      self.save
    end
  end
end
