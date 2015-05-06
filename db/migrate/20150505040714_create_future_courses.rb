class CreateFutureCourses < ActiveRecord::Migration
  def change
    create_table :future_courses do |t|
      t.string :name, null: false
      t.string :organization
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
