class RemoveImageableTypeAndImageableIdFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :imageable_type, :string
    remove_column :images, :imageable_id, :integer
  end
end
