class Post < Article
  include RailsAdmin::PostAdmin

  validates :category, presence: true
  validates :image, presence: true

  belongs_to :category
end
