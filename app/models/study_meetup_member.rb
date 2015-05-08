class StudyMeetupMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :study_meetup
end
