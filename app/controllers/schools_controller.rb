class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    university = University.find(params[:university_id])
    @schools = university.schools
  end

  def index_courses_professors
    @school_id = params[:school_id]
  end
end
