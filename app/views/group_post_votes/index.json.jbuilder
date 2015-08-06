json.array!(@meetup_post_votes) do |meetup_post_vote|
  json.extract! meetup_post_vote, :id, :user_id, :meetup_post_id
  json.url meetup_post_vote_url(meetup_post_vote, format: :json)
end
