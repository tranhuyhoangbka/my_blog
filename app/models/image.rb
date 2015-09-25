class Image < ActiveRecord::Base
  belongs_to :photo, inverse_of: :images
end
