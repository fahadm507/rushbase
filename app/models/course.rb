class Course < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :organization
  has_many   :students, class_name: :user

  has_many   :course_posts
end
