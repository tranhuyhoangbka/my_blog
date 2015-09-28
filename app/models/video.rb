class Video < Article
  include RailsAdmin::VideoAdmin

  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }

  validates :image, attachment_presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :video, presence: true

  enum video_type: [:normal, :embed]

end
