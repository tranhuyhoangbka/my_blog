class Comment < ActiveRecord::Base
  has_attached_file(:url,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_visibility => 'public',
    )
  validates_attachment_content_type :url, :content_type => /\Aimage\/.*\Z/
end
