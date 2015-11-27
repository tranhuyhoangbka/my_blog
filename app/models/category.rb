class Category < ActiveRecord::Base
  include RailsAdmin::CategoryAdmin
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: {minimum: 6, maximum: 50}
  validates :description, presence: true, length: {minimum: 12}

  has_many :article_categories, dependent: :destroy
  has_many :posts, through: :article_categories

  friendly_id :name, use: :slugged

  has_attached_file :image,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates :image, attachment_presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method:
  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '2' }

  def in_country?
    self.name == Settings.except_cate.in_country
  end
end
