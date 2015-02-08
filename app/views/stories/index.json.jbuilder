json.array!(@stories) do |story|
  json.extract! story, :id, :title, :stage, :project_id, :content, :point
  json.url story_url(story, format: :json)
end
