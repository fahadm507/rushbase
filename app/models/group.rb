class Group < ActiveRecord::Base
  has_many   :group_members
  has_many :group_posts
  has_many   :users, through: :group_members

  belongs_to :user

  include HTTParty

  base_uri 'www.udacity.com'
  
  def member?(user)
    self.users.include?(user)
  end

  def self.create_groups
    response = HTTParty.get("https://www.udacity.com/public-api/v0/courses")
    courses = response["courses"]

    courses.each do |course|
      self.find_or_create_by(
        name: course['title'],
        provider: "Udacity",
        banner_image: course['banner_image'],
        course_link: course['course_link']
        )
    end
  end

  def self.create_coursera_groups
    coursera_res = HTTParty.get("https://api.coursera.org/api/catalog.v1/courses")
    courses = coursera_res["elements"]

    courses.each do |course|
      self.find_or_create_by(
        name: course['name'],
        provider: "Coursera"
      )
    end
  end
end
