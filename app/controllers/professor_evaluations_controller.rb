class ProfessorEvaluationsController < ApplicationController
  before_action :set_professor_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /professor_evaluations
  # GET /professor_evaluations.json
  def index
    @professor_evaluations = ProfessorEvaluation.all
  end

  # GET /professor_evaluations/1
  # GET /professor_evaluations/1.json
  def show
  end

  # GET /professor_evaluations/new
  def new
    @professor_id = params[:professor_id]
    professor = Professor.find(@professor_id)
    @course_list = professor.courses
    if @course_list.blank?
      redirect_to professor_path(id: params[:professor_id]), notice:  'Este profesor no tiene cursos asignados'
    else
      @professor_evaluation = ProfessorEvaluation.new
    end
  end

  # GET /professor_evaluations/1/edit
  def edit
  end

  # POST /course_evaluations
  # POST /course_evaluations.json
  def create
    professor_id = params[:professor_id].to_i
    @post_params = post_params_array
    evaluated_course_id = professor_evaluation_params[:course_id].to_i
    evaluation = ProfessorEvaluation.where(['user_id = ? and professor_id = ? and course_id = ?',current_user.id, professor_id, evaluated_course_id])
    if evaluation.blank?
      @professor_evaluation = ProfessorEvaluation.new(professor_evaluation_params)
      @professor_evaluation.user_id = current_user.id
      @professor_evaluation.professor_id = professor_id
      @professor_evaluation.overall_score = calculate_overall_score
      if @professor_evaluation.save
        modify_evaluated_professor
        modify_professor_course_evaluations
        redirect_to professor_path(id: professor_id), notice:  evaluation
      else
        render :new, notice:  'Hubo un error al evaluar'
      end
    else
      redirect_to professor_path(id: professor_id), notice:  'Ya habías evaluado a este profesor en dicho curso, solo se puede una vez!'
    end
  end

  # PATCH/PUT /professor_evaluations/1
  # PATCH/PUT /professor_evaluations/1.json
  def update
    respond_to do |format|
      if @professor_evaluation.update(professor_evaluation_params)
        format.html { redirect_to @professor_evaluation, notice: 'Professor evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @professor_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professor_evaluations/1
  # DELETE /professor_evaluations/1.json
  def destroy
    @professor_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to professor_evaluations_url, notice: 'Professor evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor_evaluation
      @professor_evaluation = ProfessorEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_evaluation_params
      params.require(:professor_evaluation).permit(:arrival_puntuality, :feedback_puntuality, :knowledge, :addresses_questions, :learning_interest, :difficulty, :clearness, :respectful, :course_id)
    end

    def modify_evaluated_professor
      professor = Professor.find(params[:professor_id])
      professor.evaluation_quantity = professor.evaluation_quantity + 1
      professor.overall_score = professor.overall_score +  @professor_evaluation.overall_score
      professor.overall_arrival_puntuality = professor.overall_arrival_puntuality + @professor_evaluation.arrival_puntuality
      professor.overall_feedback_puntuality = professor.overall_feedback_puntuality + @professor_evaluation.feedback_puntuality
      professor.overall_knowledge = professor.overall_knowledge + @professor_evaluation.knowledge
      professor.overall_addresses_questions = professor.overall_addresses_questions + @professor_evaluation.addresses_questions
      professor.overall_learning_interest = professor.overall_learning_interest + @professor_evaluation.learning_interest
      professor.overall_difficulty = professor.overall_difficulty + @professor_evaluation.difficulty
      professor.overall_clearness = professor.overall_clearness + @professor_evaluation.clearness
      professor.overall_respect = professor.overall_respect + @professor_evaluation.respectful
      professor.save
    end

    def modify_professor_course_evaluations
      professor_course_evaluation = ProfessorCourseEvaluation.where(['professor_id = ? and course_id = ?', params[:professor_id].to_i, @professor_evaluation.course_id]).limit(1).first
      professor_course_evaluation.evaluation_quantity = professor_course_evaluation.evaluation_quantity + 1
      professor_course_evaluation.overall_score = professor_course_evaluation.overall_score +  @professor_evaluation.overall_score
      professor_course_evaluation.overall_arrival_puntuality = professor_course_evaluation.overall_arrival_puntuality + @professor_evaluation.arrival_puntuality
      professor_course_evaluation.overall_feedback_puntuality = professor_course_evaluation.overall_feedback_puntuality + @professor_evaluation.feedback_puntuality
      professor_course_evaluation.overall_knowledge = professor_course_evaluation.overall_knowledge + @professor_evaluation.knowledge
      professor_course_evaluation.overall_addresses_question = professor_course_evaluation.overall_addresses_question + @professor_evaluation.addresses_questions
      professor_course_evaluation.overall_learning_interest = professor_course_evaluation.overall_learning_interest + @professor_evaluation.learning_interest
      professor_course_evaluation.overall_difficulty = professor_course_evaluation.overall_difficulty + @professor_evaluation.difficulty
      professor_course_evaluation.overall_clearness = professor_course_evaluation.overall_clearness + @professor_evaluation.clearness
      professor_course_evaluation.overall_respect = professor_course_evaluation.overall_respect + @professor_evaluation.respectful
      professor_course_evaluation.save
    end

    def calculate_overall_score
      res = 0
      @post_params.each do |val|
        res += val
      end
      res = (res - professor_evaluation_params[:difficulty].to_i - professor_evaluation_params[:course_id].to_i)/7.0
      return res
    end

    def post_params_array
      array = []
      professor_evaluation_params.each do |key, value|
        array.push(value.to_i)
      end
      return array
    end
end
