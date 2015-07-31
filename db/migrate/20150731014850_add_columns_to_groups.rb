class AddColumnsToGroups < ActiveRecord::Migration
  def up
  	add_column :groups, :banner_image, :string
    add_column :groups, :provider, :string
    add_column :groups, :course_link, :string
  end

  def down
  	remove_column :groups, :banner_image, :string
    remove_column :groups, :provider, :string
    remove_column :groups, :course_link, :string
  end
end
