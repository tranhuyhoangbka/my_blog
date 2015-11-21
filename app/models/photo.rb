class Photo < Article
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc{|attributes| attributes[:url].blank?}

  has_attached_file :image, :styles => {
      :thumb => "140x140#",
      :small  => "200x200#",
      :medium => "300x300>" }
end
