class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      t.string :name
      t.text :About
      t.text :goal
      t.text :requirements
      t.integer :user_id
      t.integer :course_id
    end
  end
end
