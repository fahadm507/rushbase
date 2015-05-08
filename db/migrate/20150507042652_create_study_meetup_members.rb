class CreateStudyMeetupMembers < ActiveRecord::Migration
  def change
    create_table :study_meetup_members do |t|
      t.integer :user_id, null: false
      t.integer :study_meetup_id, null: false

      t.timestamps
    end
  end
end
