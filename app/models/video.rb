class Video < Article
  enum video_type: [:normal, :embed]

  validates :image, :video, presence: true
end
