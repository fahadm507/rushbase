class CreateStudyMeetups < ActiveRecord::Migration
  def change
    create_table :study_meetups do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.text :goal

      t.timestamps
    end
  end
end
