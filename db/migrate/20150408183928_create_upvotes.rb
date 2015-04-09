class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :count, default: 0
      t.integer :user_id, null: false
      t.integer :user_post_id, null: false

      t.timestamps
    end
  end
end
