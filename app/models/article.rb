class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 6, maximum: 200}
  validates :content, presence: true, length: {minimum: 15}
end
