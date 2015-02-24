class Instructor < ActiveRecord::Base
  has_many :courses
  belongs_to :organization

  def self.get_instructor(current_user)
    where(user_id: current_user.id)
  end
end
