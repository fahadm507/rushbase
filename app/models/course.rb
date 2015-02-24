class Course < ActiveRecord::Base
  belongs_to :instructor
  has_many :students, class_name: :user
end
