class ChangeTypeFromArticles < ActiveRecord::Migration
  def change
    change_column :articles, :type, :string
  end
end
