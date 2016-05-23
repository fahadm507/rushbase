class RenameOrganizationToSchools < ActiveRecord::Migration
  def self.up
    rename_table :ogranizations, :schools
  end
end
