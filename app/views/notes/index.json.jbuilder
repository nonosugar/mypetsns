json.array!(@notes) do |note|
  json.extract! note, :id, :title, :user_id, :content, :image
  json.url note_url(note, format: :json)
end
