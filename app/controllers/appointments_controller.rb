class AppointmentsController < ApplicationController

  def show
    @appointment = Appointment.find_by(id: params[:id])
    @doctor = @appointment.doctor
    @patient = @appointment.patient
    unless current_user.role == @appointment.patient || current_user.role == @appointment.doctor
      redirect_to root_path
    end
  end

end
