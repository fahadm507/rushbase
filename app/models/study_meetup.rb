class StudyMeetup < ActiveRecord::Base
  belongs_to :user
  has_many :study_meetup_members
  has_many :users, through: :study_meetup_members
end
