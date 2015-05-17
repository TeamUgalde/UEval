class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index, :create]

  def index
    @notifications = current_user.notifications.order("created_at DESC")
    render :layout => false
  end


  def new
    @notification = Notification.new
    render :layout => false
  end


  def create
    @notification = Professor.new(professor_params)
    @notification.user_id = params[:creator_id]

    respond_to do |format|
      if @notification.save
        format.html { redirect_to school_professors_path, notice: 'Professor was successfully created.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: school_professors_path.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:professor).permit(:subject, :description)
    end
end
