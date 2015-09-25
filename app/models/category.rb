class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: {minimum: 6, maximum: 50}
  validates :description, presence: true, length: {minimum: 12}
  validates :image, presence: true
end
