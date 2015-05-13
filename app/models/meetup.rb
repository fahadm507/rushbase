class Meetup < ActiveRecord::Base
  belongs_to :user
  has_many :meetup_members
  has_many :meetup_posts
  has_many :users, through: :meetup_members
end
