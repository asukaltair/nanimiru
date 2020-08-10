class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.boolean :is_active, default: true, null: false
      t.integer :user_id, null: false
      t.integer :photo_id, null: false

      t.timestamps
    end
  end
end
