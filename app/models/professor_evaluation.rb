class ProfessorEvaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :professor
end
