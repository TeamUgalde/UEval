json.array!(@professor_evaluations) do |professor_evaluation|
  json.extract! professor_evaluation, :id, :arrival_puntuality, :feedback_puntuality, :knowledge, :addresses_questions, :learning_interest, :difficulty, :clearness, :respectful, :course_name, :overall_score
  json.url professor_evaluation_url(professor_evaluation, format: :json)
end
