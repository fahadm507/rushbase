class AddIndexToMeetupMembers < ActiveRecord::Migration
  def change
    add_index :meetup_members, :meetup_id
    add_index :meetup_members, :user_id
    add_index :meetup_members, [:user_id, :meetup_id], unique: true
  end
end
