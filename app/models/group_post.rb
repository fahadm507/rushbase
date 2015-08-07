class GroupPost < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  has_many :comments
  has_many :group_post_votes
end
