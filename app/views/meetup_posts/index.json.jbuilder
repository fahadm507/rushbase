json.array!(@meetup_posts) do |meetup_post|
  json.extract! meetup_post, :id, :title, :description, :meetup_id, :user_id
  json.url meetup_post_url(meetup_post, format: :json)
end
