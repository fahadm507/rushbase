json.array!(@comments) do |comment|
  json.extract! comment, :id, :description, :meetup_post_id, :user_id
  json.url comment_url(comment, format: :json)
end
