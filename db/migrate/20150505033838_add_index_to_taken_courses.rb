class AddIndexToTakenCourses < ActiveRecord::Migration
  def change
    add_index :taken_courses, :user_id
    add_index :taken_courses, :name
    add_index :taken_courses, :organization
    add_index :taken_courses, [:user_id, :name, :organization ], unique: true
  end
end
