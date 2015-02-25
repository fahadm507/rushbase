class CourseComment < ActiveRecord::Base
  belongs_to :course_post
  belongs_to :user
end
