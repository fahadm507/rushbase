json.array!(@group_posts) do |group_post|
  json.extract! group_post, :id, :title, :description, :group_id, :user_id
  json.url group_post_url(group_post, format: :json)
end
