class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :user_id
      t.integer :user_team_id
    end
  end
end
