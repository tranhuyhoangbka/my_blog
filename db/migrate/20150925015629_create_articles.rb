class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :video
      t.integer :type

      t.timestamps null: false
    end
  end
end
