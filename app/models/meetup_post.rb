class MeetupPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :meetup
  has_many :comments
  has_many :meetup_post_votes
end
