class AddColumnToUserTeams < ActiveRecord::Migration
  def change
    add_column :user_teams, :private, :boolean, default: false
  end
end
