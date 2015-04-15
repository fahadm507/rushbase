class CreateTakenCourses < ActiveRecord::Migration
  def change
    create_table :taken_courses do |t|
      t.string :name
      t.string :organization
      t.integer :user_id
    end
  end
end
