class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index, :create]
  before_action :authenticate_user!, except: [:index]

  def index
    @notifications = current_user.notifications.order("created_at DESC")
    render :layout => false
  end

  def create
    buildNotification
    @notification = Notification.new(user_id: params[:user_id], subject: @subject, description: @description)

    if @notification.save
      flash[:notice] = 'Se ha enviado la notificación!'
    else
      flash.now[:notice] = 'No se pudo enviar la notificación al usuario!'
    end
    redirect_to "/profile#pending-#{params[:resource]}"
  end

  private

    def buildNotification
      if(params[:state].to_s == "accepted")
        subjectAction = " ha sido acceptado!"
        descriptionAction = " que añadiste se encuentra disponible para evaluar. Gracias por colaborar con la universidad:"
      else
        subjectAction = " ha sido rechazado!"
        descriptionAction = " que añadiste no cumple con las condiciones, está repetido o no es válido en la universidad:"
      end
      if(params[:resource] == "professors")
        resourceName = "El profesor "
        resource = Professor.find(params[:resource_id])
        last_name = resource.last_name
      else
        resourceName = "El curso "
        resource = Course.find(params[:resource_id])
        last_name = ""
      end
      @subject = "El profesor #{resource.name} #{last_name} #{subjectAction}"
      @description = "#{resourceName} #{descriptionAction} #{University.find(resource.school_id).name}!"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:subject, :description, :user_id)
    end
end
