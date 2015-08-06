json.array!(@study_meetups) do |study_meetup|
  json.extract! study_meetup, :id, :name, :description, :user_id, :goal
  json.url study_meetup_url(study_meetup, format: :json)
end
