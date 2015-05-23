class AddMoreFieldsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :provider, :string
    add_column :courses, :banner_image, :string
    add_column :courses, :course_link, :string
  end
end
