json.array!(@boards) do |board|
  json.extract! board, :id, :topic
  json.url board_url(board, format: :json)
end
