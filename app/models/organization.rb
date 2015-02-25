class Organization < ActiveRecord::Base
  belongs_to :user

  has_many   :courses
  has_many   :instructors
end
