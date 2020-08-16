class AddStarToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :star, :float, null: false, default: 0
  end
end
