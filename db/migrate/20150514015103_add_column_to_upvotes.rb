class AddColumnToUpvotes < ActiveRecord::Migration
  def change
    add_column :upvotes, :meetup_post_id, :integer
    add_index  :upvotes, :meetup_post_id
    add_index  :upvotes, [:meetup_post_id, :user_id]
  end
end
