class CreateUserPosts < ActiveRecord::Migration
  def change
    create_table :user_posts do |t|
      t.text :description, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
