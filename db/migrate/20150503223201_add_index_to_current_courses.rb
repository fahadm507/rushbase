class AddIndexToCurrentCourses < ActiveRecord::Migration
  def change
    add_index :current_courses, :user_id
    add_index :current_courses, :name
    add_index :current_courses, :organization
    add_index :current_courses, [:user_id, :name, :organization ], unique: true
  end
end
