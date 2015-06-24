class CreateUpvotes < ActiveRecord::Migration
  def up
    create_table :upvotes do |t|
      t.integer :user_id, null: false
      t.integer :user_post_id, null: false
    end
    add_index :upvotes, :user_post_id
    add_index :upvotes, :user_id
    add_index :upvotes, [:user_post_id, :user_id], unique: true
  end
end
