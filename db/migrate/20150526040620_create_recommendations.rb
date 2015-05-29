class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id, null: false
      t.integer :course_id, null: false
    end

    add_index :recommendations, :user_id
    add_index :recommendations, :course_id
    add_index :recommendations, [:course_id, :user_id]
  end
end
