class RenameMeetupPostsToGroupPosts < ActiveRecord::Migration
  def self.up
    rename_table :meetup_posts, :group_posts
    rename_column :group_posts, :meetup_id, :group_id
  end 
  def self.down
    rename_table :group_posts, :meetup_posts
    rename_column :group_posts,  :group_id, :meetup_id
  end
end
