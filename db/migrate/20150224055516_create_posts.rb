class CreatePosts < ActiveRecord::Migration
  def change
    create_table :course_posts do |t|
      t.string :title
      t.string :description, null: false
      t.integer :user_id, null: false
      t.integer :course_id, null: false

      t.timestamps
    end
  end
end
