class CoursePost < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  has_many :course_comments
end
