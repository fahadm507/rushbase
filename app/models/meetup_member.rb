class MeetupMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :meetup

  def self.member?(user, meetup)
    where(user_id: user.id, meetup_id: meetup.id).present?
  end
end
