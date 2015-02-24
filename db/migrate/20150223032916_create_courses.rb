class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :instructor_id, null: false
      t.integer :organization_id, null: false

      t.timestamps
    end
  end
end
