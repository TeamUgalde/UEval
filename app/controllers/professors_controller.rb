class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :index_pending]

  respond_to :json
  respond_to :html

  # GET /professors
  # GET /professors.json
  def index
    school = School.find(params[:school_id])
    @professors = school.professors.order("overall_score DESC")
    render layout: false
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
    @professor = Professor.find(params[:id])
    @professor_courses = @professor.courses.where(state: 'accepted')
    evaluations_quantity = @professor.evaluation_quantity
    if evaluations_quantity > 0
      @overall_score_average = (@professor.overall_score / evaluations_quantity).round(1)
    else
      @overall_score_average = 0
    end
  end

  # GET /professors/new
  def new

    @school_id = params[:school_id]
    @professor = Professor.new
    @courses = School.find(@school_id).courses.where(state: 'accepted')
  end

  # GET /professors/1/edit
  def edit
    @school_id = @professor.school_id
  end

  def destroy
    @professor.destroy
    flash[:notice] = 'Se ha rechazado y eliminado el profesor!'
    redirect_to profile_path, status: 303
  end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new
    @professor.name = professor_params[:name]
    @professor.last_name = professor_params[:last_name]
    @professor.overall_score = 0;
    @professor.school_id = params[:school_id]
    @professor.creator_id = current_user.id

    respond_to do |format|
      if @professor.save
        add_selected_courses
        format.html { redirect_to school_courses_professors_path, notice: 'El profesor fue creado, enviaremos una notificación para que sepas si fue aceptado!' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: school_professors_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_professor_course_evaluation
    @professor_course_evaluation = ProfessorCourseEvaluation.find(params[:id])
    professor = Professor.find(@professor_course_evaluation.professor_id)
    @professor_name = "#{professor.name} #{professor.last_name}"
    course = Course.find(@professor_course_evaluation.course_id)
    @course_name = course.name
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    @professor.state = 'accepted'
    @professor.save
    flash[:notice] = 'Se ha aceptado el profesor!'
    redirect_to profile_path, status: 303
  end

  def index_pending
    @professors = Professor.where(state: 'pending').order("created_at DESC")
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:name, :last_name, :professor_courses => [])
    end

    def add_selected_courses
      professor_courses = professor_params[:professor_courses]
      professor_courses.each do |c|
        id = c.to_i
        if id != 0
          @professor.courses << Course.find(id)
          insert_professor_course_evaluation(@professor.id, id)
        end
      end
    end

    def insert_professor_course_evaluation(professor_id, course_id)
      professor_course_evaluation = ProfessorCourseEvaluation.new
      professor_course_evaluation.professor_id = professor_id
      professor_course_evaluation.course_id = course_id
      professor_course_evaluation.save
    end
end
