class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    school = School.find(params[:school_id])
    @courses = school.courses
    render layout: false
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @course_professors = @course.professors
  end

  # GET /courses/new
  def new
    @course = Course.new
    @school_id = params[:school_id]
  end

  # GET /courses/1/edit
  def edit
    @school_id = @course.school_id
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to school_courses_path, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: school_courses_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to school_courses_path, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: school_courses_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    path = "/schools/#{@course.school_id}/courses"
    @course.destroy
    respond_to do |format|
      format.html { redirect_to path, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index_pending
    @courses = Course.where(state: 'pending')
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :overall_difficulty)
    end
end
