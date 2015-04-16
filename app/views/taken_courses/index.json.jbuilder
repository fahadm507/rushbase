json.array!(@taken_courses) do |taken_course|
  json.extract! taken_course, :id
  json.url taken_course_url(taken_course, format: :json)
end
