json.array!(@comments) do |comment|
  json.extract! comment, :id, :cont, :user_id, :lecture_id
  json.url comment_url(comment, format: :json)
end
