class School < ActiveRecord::Base
  belongs_to :university
  has_many :courses, :dependent => :destroy
  has_many :professors, :dependent => :destroy
end
