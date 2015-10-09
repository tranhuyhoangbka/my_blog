class AddSexToStudent < ActiveRecord::Migration
  def change
    add_column :students, :sex, :integer
  end
end
