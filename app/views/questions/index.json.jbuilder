json.array!(@questions) do |question|
  json.extract! question, :id, :content, :user_id, :title
  json.url question_url(question, format: :json)
end
