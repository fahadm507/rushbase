class RenameMeetupPostVotesToGroupPostVotes < ActiveRecord::Migration
  def self.up
    rename_table :meetup_post_votes, :group_post_votes
    rename_column :group_post_votes, :meetup_post_id, :group_post_id
  end 

  def self.down
    rename_table :group_post_votes, :meetup_post_votes
    rename_column :group_post_votes,  :group_post_id, :meetup_post_id
  end
end
