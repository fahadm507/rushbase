class Course < ActiveRecord::Base
  ratyrate_rateable "experience"

  belongs_to :instructor
  belongs_to :organization
  has_many   :course_reviews
  has_many   :students, class_name: :user
  has_many   :user_teams
  has_many   :course_posts
  has_many   :reviews
  has_one    :group, dependent: :destroy
  has_many   :recommendations

end
