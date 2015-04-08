class User < ActiveRecord::Base
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
  has_many   :course_posts
  has_many   :course_comments
  has_many   :user_posts
  has_many   :user_comments
  belongs_to :location
  belongs_to  :industry

  def full_name
  	"#{first_name} #{last_name}"
  end
end
