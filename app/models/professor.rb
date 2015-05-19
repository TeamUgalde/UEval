class Professor < ActiveRecord::Base
  belongs_to :school
  has_and_belongs_to_many :courses
  has_many :professor_evaluations, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy
  has_many :professor_course_evaluations, :dependent => :destroy

  attr_accessor :professor_courses
end
