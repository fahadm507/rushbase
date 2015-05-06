class AddIndexToFutureCourses < ActiveRecord::Migration
  def change
    add_index :future_courses, :user_id
    add_index :future_courses, :name
    add_index :future_courses, :organization
    add_index :future_courses, [:user_id, :name, :organization ], unique: true
  end
end
