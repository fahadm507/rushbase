class AddIndexToUpvotes < ActiveRecord::Migration
  def change
    add_index :upvotes, :user_post_id
    add_index :upvotes, :user_id
    add_index :upvotes, [:user_post_id, :user_id], unique: true
  end
end
