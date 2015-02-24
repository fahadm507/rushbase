class AddColumnsToOrganizations < ActiveRecord::Migration
  def up
    add_column :organizations, :name, :string, required: true
    add_column :organizations, :description, :text
    add_column :organizations, :user_id, :integer
  end

  def down
    add_column :organizations, :name, :string, required: true
    add_column :organizations, :description, :text
    add_column :organizations, :user_id, :integer
  end
end
