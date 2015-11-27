class AddAttachmentUrlToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.attachment :url
    end
  end

  def self.down
    remove_attachment :comments, :url
  end
end
