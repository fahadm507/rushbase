class RemoveColumFromUserPosts < ActiveRecord::Migration
  def add
    remove_column :user_posts, :post_id, :integer
    add_column :user_posts, :user_post_id, :integer
  end

  def remove
    add_column :userposts, :user_post_id
  end

end
