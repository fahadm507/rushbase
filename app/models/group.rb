class Group < ActiveRecord::Base
  has_many   :group_members
  has_many :group_posts
  has_many   :users, through: :group_members

  belongs_to :user
  belongs_to :course, dependent: false

  include HTTParty

  base_uri 'www.udacity.com'
  
  def member?(user)
    self.users.include?(user)
  end

end
