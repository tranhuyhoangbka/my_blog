class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 6, maximum: 50}
  validates :content, presence: true, length: {minimum: 15}
end
