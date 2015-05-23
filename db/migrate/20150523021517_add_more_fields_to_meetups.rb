class AddMoreFieldsToMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :course_id, :integer
    remove_column :meetups, [:provider, :banner_image, :course_link]
  end
end
