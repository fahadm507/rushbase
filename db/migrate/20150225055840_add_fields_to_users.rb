class AddFieldsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :about, :text
    add_column :users, :interests, :text
    add_column :users, :industry_id, :integer
  end

  def down
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :about, :text
    remove_column :users, :interests, :text
    remove_column :users, :industry_id, :integer
  end
end
