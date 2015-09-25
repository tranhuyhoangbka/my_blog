class Photo < Article
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc{|attributes| attributes[:url].blank?}
end
