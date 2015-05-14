json.array!(@professors) do |professor|
  json.extract! professor, :id, :name, :last_name, :overall_score
  json.url professor_url(professor, format: :json)
end
