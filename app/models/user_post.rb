class UserPost < ActiveRecord::Base
  belongs_to :user
  has_many :post_comments
end
