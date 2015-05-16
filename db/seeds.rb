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
  Industry.create(name: cat)
end



