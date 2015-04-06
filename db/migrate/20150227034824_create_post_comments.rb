class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.string  :body, null: false
      t.integer :user_post_id, null: false

      t.timestamps
    end
  end
end
