class CreateFutureCourses < ActiveRecord::Migration
  def change
    create_table :future_courses do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.integer :organization

      t.timestamps
    end
  end
end
