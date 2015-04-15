class CreateCurrentCourses < ActiveRecord::Migration
  def change
    create_table :current_courses do |t|
      t.string :name
      t.string :organization
      t.integer :user_id
    end
  end
end
