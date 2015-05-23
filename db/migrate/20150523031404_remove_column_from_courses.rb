class RemoveColumnFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :instructor_id, :integer
  end
end
