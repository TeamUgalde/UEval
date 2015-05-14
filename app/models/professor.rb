class Professor < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :courses
  has_many :professor_evaluations
  has_many :comments, as: :commentable
end
