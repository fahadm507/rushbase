class CreateCourseReviews < ActiveRecord::Migration
  def change
    create_table :course_reviews do |t|
      t.string :title
      t.text :description, null: false
      t.integer :user_id, null: false
      t.integer :course_id, null: false

      t.timestamps
    end
  end
end
