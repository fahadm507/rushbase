class Course < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :organization
  has_many   :students, class_name: :user
  has_many   :user_teams
  has_many   :course_posts
  has_many   :reviews
  has_one :meetup
  has_many   :recommendations


  def self.create_courses
    response = HTTParty.get("https://www.udacity.com/public-api/v0/courses")
    courses = response["courses"]

    courses.each do |course|
      org = Organization.find_or_create_by(name: "Udacity")

      c = self.find_or_create_by(
        name: course['title'],
        description: course['summary'],
        provider: "Udacity",
        banner_image: course['banner_image'],
        course_link: course['course_link'],
        organization_id: org.id
        )

      Meetup.find_or_create_by(
        name: c.name,
        course_id: c.id
      )
    end
  end
  def self.create_coursera_courses
    coursera_res = HTTParty.get("https://api.coursera.org/api/catalog.v1/courses")
    courses = coursera_res["elements"]

    courses.each do |course|
      org = Organization.find_or_create_by(name: "Coursera")
      c = self.find_or_create_by(
        name: course['name'],
        provider: "Coursera",
        organization_id: org.id,
        description: " "
      )

      Meetup.find_or_create_by(
        name: c.name,
        course_id: c.id
      )
    end
  end
end
