class AlterColumnsOnGroups < ActiveRecord::Migration
  def up
  	add_column :groups, :user_id, :integer
  	add_column :groups, :industry_id, :integer, null: true
  	change_column :groups, :description, :string, null: true
  end

  def down
  	remove_column :groups, :user_id
  	remove_column :groups, :industry_id
  	change_column :groups, :description
  end
end
