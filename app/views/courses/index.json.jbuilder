json.array!(@courses) do |course|
  json.extract! course, :id, :name, :overall_difficulty
  json.url course_url(course, format: :json)
end
