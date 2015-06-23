class UserPost < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model) {controller && controller.current_user}

  belongs_to :user
  has_many   :post_comments
  has_many   :upvotes
end
