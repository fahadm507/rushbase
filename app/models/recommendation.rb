class Recommendation < ActiveRecord::Base
  belongs_to :users
  belongs_to :course
end
