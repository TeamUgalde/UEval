class CourseEvaluationsController < ApplicationController
  before_action :set_course_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /course_evaluations/new
  def new
    @course_evaluation = CourseEvaluation.new
    @course_id = params[:course_id]
  end

  # POST /course_evaluations
  # POST /course_evaluations.json
  def create
    evaluation = CourseEvaluation.where(['user_id = ? and course_id = ?',current_user.id, params[:course_id]])
    if evaluation.blank?
      @course_evaluation = CourseEvaluation.new
      @course_evaluation.difficulty = course_evaluation_params[:difficulty].to_i
      @course_evaluation.user_id = current_user.id
      @course_evaluation.course_id = params[:course_id]
      if @course_evaluation.save
        modify_evaluated_course
        redirect_to course_path(id: params[:course_id]), notice:  'Se ha evaluado el curso con éxito!'
      else
        render :new, notice:  'Hubo un error al evaluar el curso'
      end
    else
      redirect_to course_path(id: params[:course_id]), notice:  'Ya habías evaluado este curso, solo se puede una vez!'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_evaluation
      @course_evaluation = CourseEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_evaluation_params
      params.require(:course_evaluation).permit(:difficulty)
    end

    def modify_evaluated_course
      course = Course.find(params[:course_id])
      course.overall_difficulty = course.overall_difficulty + @course_evaluation.difficulty
      course.evaluation_quantity = course.evaluation_quantity + 1
      course.save
    end
end
