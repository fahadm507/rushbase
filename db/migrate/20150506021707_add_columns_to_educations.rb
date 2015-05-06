class AddColumnsToEducations < ActiveRecord::Migration
  def change
    add_column :educations, :year, :integer
    add_column :educations, :graduated, :boolean
  end
end
