json.array!(@votes) do |vote|
  json.extract! vote, :id, :number, :comment_id, :link_id, :user_id
  json.url vote_url(vote, format: :json)
end
