class GroupPostVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :group_post
end
