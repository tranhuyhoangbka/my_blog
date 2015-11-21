class Video < Article
  enum video_type: [:normal, :embed]

  validates :image, :video, presence: true

  has_attached_file :image, :styles => {
      :thumb => "140x140#",
      :small  => "200x200#",
      :medium => "300x300>" }
end
