class Change < ActiveRecord::Migration
  def self.up
    rename_column :comments, :meetup_post_id, :group_post_id
  end 
  def self.down
    rename_column :comments, :group_post_id, :meetup_post_id
  end
end
