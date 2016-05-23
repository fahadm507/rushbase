# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

string_of_categories = "Accounting
Animation
Arts and Crafts
Aviation & Aerospace
Banking
Biotechnology
Broadcast Media
Civil Engineering
Computer & Network Security
Computer Games
Computer Hardware
Computer Networking
Computer Software
Design
Education Management
E-Learning
Entertainment
Financial Services
Fine Art
Graphic Design
Health, Wellness and Fitness
Higher Education
Hospital & Health Care
Hospitality
Human Resources
Industrial Automation
Information Services
Information Technology and Services
International Trade and Development
Internet
Investment Banking
Investment Management
Legal Services
Marketing and Advertising
Military
Music
Mobile Development
Nanotechnology
Nonprofit Organization Management
Online Media
Performing Arts
Pharmaceuticals
Philanthropy
Photography
Primary/Secondary Education
Professional Training & Coaching
Public Policy
Public Relations and Communications
Publishing
Research
Sports
Telecommunications
Writing and Editing
Website Development"
array_of_categories = string_of_categories.split("\n")

array_of_categories.each do |cat|
  Industry.find_or_create_by(name: cat)
end

#seed 50 users to the database
def seed_users
  Industry.all.each do |ind|
    User.create(email: "example#{ind.id}@gmail.com",
                        full_name: "Cool#{ind.id} User#{ind.id}",
                        password: 'password',
                        encrypted_password:  "password",
                        industry_id: ind.id)
  end
end

def create_udacity_courses
    response = HTTParty.get("https://www.udacity.com/public-api/v0/courses")
    courses = response["courses"]

    courses.each do |course|
      org = Organization.find_or_create_by(name: "Udacity")

      c = Course.find_or_create_by(
        name: course['title'],
        description: course['summary'],
        provider: "Udacity",
        banner_image: course['banner_image'],
        course_link: course['course_link'],
        organization_id: org.id
        )

      Group.find_or_create_by(
        name: c.name,
        course_id: c.id
      )
    end 
  end
def create_coursera_courses
  coursera_res = HTTParty.get("https://api.coursera.org/api/catalog.v1/courses")
  courses = coursera_res["elements"]

  courses.each do |course|
    org = Organization.find_or_create_by(name: "Coursera")
    c = Course.find_or_create_by(
      name: course['name'],
      provider: "Coursera",
      organization_id: org.id,
      description: " "
    )

    Group.find_or_create_by(
      name: c.name,
      course_id: c.id
    )
  end
end

def api_data
  create_udacity_courses
  create_coursera_courses
end

def add_schools

  schools = ['Udacity', 'Edx', 'Launch Academy', 'Coursera','Hacker Reactor', 'Udemy' ]

  schools.each do |s|
    School.find_or_create_by(name: s.name);
  end

end

#functions calls to seed the database
seed_users
add_schools
api_data


