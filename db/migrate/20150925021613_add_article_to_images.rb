class AddArticleToImages < ActiveRecord::Migration
  def change
    add_reference :images, :article, index: true, foreign_key: true
  end
end
