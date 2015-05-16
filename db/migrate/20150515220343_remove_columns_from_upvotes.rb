class RemoveColumnsFromUpvotes < ActiveRecord::Migration
  def up
    remove_column :upvotes, :count, :integer
    remove_column :upvotes, :meetup_post_id, :integer
  end
end
