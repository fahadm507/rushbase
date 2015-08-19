class AddCourseIdToGroups < ActiveRecord::Migration
  def up
  	add_column :groups, :course_id, :integer
  end

  def down
  	remove_column :groups, :course_id
  end
end
