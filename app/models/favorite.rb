class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_post_id
end
