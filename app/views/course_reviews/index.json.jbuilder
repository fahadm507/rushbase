json.array!(@course_reviews) do |course_review|
  json.extract! course_review, :id, :title, :description, :user_id, :course_id
  json.url course_review_url(course_review, format: :json)
end
