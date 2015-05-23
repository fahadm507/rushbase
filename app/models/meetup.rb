class Meetup < ActiveRecord::Base
  include HTTParty

  belongs_to :user
  belongs_to :course
  has_many :meetup_members
  has_many :meetup_posts
  has_many :users, through: :meetup_members

  def member?(user)
    self.users.include?(user)
  end

end
