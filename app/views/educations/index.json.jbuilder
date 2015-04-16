json.array!(@educations) do |education|
  json.extract! education, :id
  json.url education_url(education, format: :json)
end
