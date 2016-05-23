class AddColumnSchoolIdToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :school_id, :integer
  end
end
