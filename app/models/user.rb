class User < ActiveRecord::Base
  ratyrate_rater
  acts_as_followable
  acts_as_follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, styles: { medium: "300x300>",
    thumb: "250x250>", thumbnail: "50x50>", tiny: "30x30>" },
    default_url: "user-default_:style.jpeg",
    storage: :s3,
    url: ":s3_domain_url",
    path: "/:class/:attachment/:id_partition/:style/:filename'",
    s3_credentials: "config/secrets.yml"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many   :group_members
  has_many   :meetup_members
  has_many   :recommendations
  has_many   :groups, through: :group_members
  has_many   :course_posts
  has_many   :course_reviews
  has_many   :course_comments
  has_many   :meetup_post_votes
  has_many   :future_courses
  has_many   :user_posts
  has_many   :group_posts
  has_many   :study_meetups
  has_many   :taken_courses
  has_many   :upvotes
  has_many   :educations
  has_many   :post_comments
  has_many   :current_courses
  has_many   :resources
  belongs_to :location
  belongs_to :industry


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth, signed_in_resource=nil)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.reject_user(users, user)
    users.reject { |u| u.id == user.id } if user
  end

  def upvoted_post?(user, post)
    Upvote.where(user_id: user.id, user_post_id: post.id).first != nil
  end

end
