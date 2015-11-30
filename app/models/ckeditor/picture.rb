class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    :dropbox_visibility => 'private',
                    :path => "myblog/inline_article_images/:class/:attachment/:id_partition/:style/:filename",
                    :styles => {
                      :thumb => "140x140#",
                      :small  => "300x300#",
                      :medium => "500x500>" }

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
