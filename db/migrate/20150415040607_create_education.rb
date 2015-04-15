class CreateEducation < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :degree
      t.string :organization
      t.text :key_courses
      t.integer :user_id
    end
  end
end
