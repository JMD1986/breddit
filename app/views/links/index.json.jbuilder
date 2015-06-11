json.array!(@links) do |link|
  json.extract! link, :id, :title, :info, :user_id, :board_id
  json.url link_url(link, format: :json)
end
