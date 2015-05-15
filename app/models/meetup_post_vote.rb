class MeetupPostVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :meetup_post
end
