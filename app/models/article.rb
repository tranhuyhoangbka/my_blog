class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 6, maximum: 200}
  validates :content, presence: true, length: {minimum: 15}

  has_attached_file :image, :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
end
