class AddcolumnToUserPostComments < ActiveRecord::Migration
  def up
    #add_column :post_comments, :user_post_id, :integer
    remove_column :post_comments, :post_id, :integer
    remove_column :user_posts, :user_post_id, :integer
  end
end
