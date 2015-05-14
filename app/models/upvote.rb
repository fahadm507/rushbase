class Upvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_post
  belongs_to :meetup_post

  def self.current(user, post)
    where(user_id: user, user_post_id: post).first
  end
end
