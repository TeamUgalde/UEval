class Course < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :professors
  has_many :course_evaluations, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy
end
