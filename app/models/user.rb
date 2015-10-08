class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  validates :username, presence: true, length: {minimum: 6}
  validates :photo, presence: true
  validates :introduction, presence: true, length: {minimum: 16}

  enum role: [:normal, :admin]
end
