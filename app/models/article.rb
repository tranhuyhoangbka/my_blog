class Article < ActiveRecord::Base
  extend FriendlyId

  validates :title, presence: true, length: {minimum: 6, maximum: 200}

  friendly_id :title, use: :slugged
end
