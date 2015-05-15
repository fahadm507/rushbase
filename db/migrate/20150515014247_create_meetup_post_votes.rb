class CreateMeetupPostVotes < ActiveRecord::Migration
  def change
    create_table :meetup_post_votes do |t|
      t.integer :user_id, null: false
      t.integer :meetup_post_id, null: false

      t.timestamps
    end
    add_index :meetup_post_votes, :user_id
    add_index :meetup_post_votes, :meetup_post_id
    add_index :meetup_post_votes, [:meetup_post_id, :user_id], unique: true
  end
end
