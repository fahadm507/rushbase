class GroupMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  def self.member?(user, group)
    where(user_id: user.id, group_id: group.id).present?
  end
end
