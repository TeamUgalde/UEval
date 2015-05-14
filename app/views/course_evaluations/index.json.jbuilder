json.array!(@course_evaluations) do |course_evaluation|
  json.extract! course_evaluation, :id, :difficulty
  json.url course_evaluation_url(course_evaluation, format: :json)
end
