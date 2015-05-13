class ChangeStudyMeetupsName < ActiveRecord::Migration
  def up
     rename_table :study_meetups, :meetups
  end

  def down
    rename_table :meetups, :study_meetups
  end
end
