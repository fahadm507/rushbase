class UserTeam < ActiveRecord::Base
  has_many   :team_members
  has_many   :users, through: :team_members
  belongs_to :user
  belongs_to :course

end
