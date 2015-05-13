class CreateMeetupPosts < ActiveRecord::Migration
  def change
    create_table :meetup_posts do |t|
      t.string :title
      t.text :description, null: false
      t.integer :meetup_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
