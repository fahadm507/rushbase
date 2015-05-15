class RemoveColumFromUpovotes < ActiveRecord::Migration
  def up
    remove_column :upvotes, :user_post_id, :integer
    add_column :upvotes, :user_post_id, :integer
  end

  def down
    add_column :upvotes, :user_post_id, :integer
    remove_column :upvotes, :user_post_id, :integer
  end
end
