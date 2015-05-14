class School < ActiveRecord::Base
  belongs_to :university
  has_many :courses
  has_many :professors
end
