class ChangeCoumnOnUpvotes < ActiveRecord::Migration
  def change
    change_column :upvotes, :user_post_id, :integer
  end
end
