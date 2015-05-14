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
    @professor_evaluation = ProfessorEvaluation.new
  end

  # GET /professor_evaluations/1/edit
  def edit
  end

  # POST /professor_evaluations
  # POST /professor_evaluations.json
  def create
    @professor_evaluation = ProfessorEvaluation.new(professor_evaluation_params)

    respond_to do |format|
      if @professor_evaluation.save
        format.html { redirect_to @professor_evaluation, notice: 'Professor evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @professor_evaluation }
      else
        format.html { render :new }
        format.json { render json: @professor_evaluation.errors, status: :unprocessable_entity }
      end
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
      params.require(:professor_evaluation).permit(:arrival_puntuality, :feedback_puntuality, :knowledge, :addresses_questions, :learning_interest, :difficulty, :clearness, :respectful, :course_name, :overall_score)
    end
end
