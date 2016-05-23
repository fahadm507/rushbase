class School < ActiveRecord::Base
  has_many   :courses
  has_many   :users
  has_many   :instructors
  has_many   :programs
end
