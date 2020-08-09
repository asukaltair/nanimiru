class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image_id, null: false
      t.string :text
      t.boolean :is_active, default: true, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
