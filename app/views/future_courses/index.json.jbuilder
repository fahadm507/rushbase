json.array!(@future_courses) do |future_course|
  json.extract! future_course, :id, :name, :user_id, :organization
  json.url future_course_url(future_course, format: :json)
end
