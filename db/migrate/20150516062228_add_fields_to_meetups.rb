class AddFieldsToMeetups < ActiveRecord::Migration
  def change
    add_column :meetups, :banner_image, :string
    add_column :meetups, :provider, :string
    add_column :meetups, :course_link, :string
  end
end
