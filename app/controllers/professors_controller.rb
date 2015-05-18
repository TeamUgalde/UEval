class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :index_pending]

  # GET /professors
  # GET /professors.json
  def index
    school = School.find(params[:school_id])
    @professors = school.professors
    render layout: false
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
  end

  # GET /professors/new
  def new
    @school_id = params[:school_id]
    @professor = Professor.new
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
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to school_professors_path, notice: 'Professor was successfully created.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: school_professors_path.errors, status: :unprocessable_entity }
      end
    end
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
    @professors = Professor.where(state: 'pending')
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:name, :last_name, :overall_score)
    end
end
