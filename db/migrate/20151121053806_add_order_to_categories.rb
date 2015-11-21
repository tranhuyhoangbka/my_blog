class AddOrderToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :order_ca, :integer, unique: true, default: 0
  end
end
