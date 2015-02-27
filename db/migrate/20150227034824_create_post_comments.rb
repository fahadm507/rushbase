class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.string  :body, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
