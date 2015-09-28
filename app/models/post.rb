class Post < Article
  include RailsAdmin::PostAdmin
  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :image, attachment_presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories

  paginates_per 10

end
