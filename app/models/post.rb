class Post < Article
  include RailsAdmin::PostAdmin

  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories

  paginates_per 10

  has_attached_file :image, :styles => {
      :thumb => "140x140#",
      :small  => "200x200#",
      :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  #validates :image, attachment_presence: true

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

end
