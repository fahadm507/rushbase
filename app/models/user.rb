class User < ActiveRecord::Base
  acts_as_followable
  acts_as_follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>",
    thumb: "100x100>", thumbnail: "50x50>", tiny: "30x30>" },
    default_url: "user-default_:style.jpeg",
    storage: :s3,
    url: ":s3_domain_url",
    path: "/:class/:attachment/:id_partition/:style/:filename'",
    s3_credentials: "config/secrets.yml"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many   :organizations
  has_many   :team_members
  has_many   :meetups, through: :meetup_members
  has_many   :user_teams, through: :team_members
  has_many   :course_posts
  has_many   :course_comments
  has_many   :future_courses
  has_many   :user_posts
  has_many   :meetup_posts
  has_many   :study_meetups
  has_many   :taken_courses
  has_many   :upvotes
  has_many   :educations
  has_many   :post_comments
  has_many   :current_courses
  has_many   :resources
  belongs_to :location
  belongs_to :industry

  def full_name
  	"#{first_name} #{last_name}"
  end

  def self.reject_user(users, user)
    users.reject { |u| u.id == user.id } if user
  end

  def upvoted_post?(user, post)
    Upvote.where(user_id: user.id, user_post_id: post.id).first
  end
end
