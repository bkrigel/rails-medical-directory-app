class PrescriptionsController < ApplicationController

  def show
    @prescription = Prescription.find_by(id: params[:id])
    @appointment = @prescription.appointment
    @doctor = @appointment.doctor
    @patient = @appointment.patient
    unless current_user.role == @patient || current_user.role == @doctor
      redirect_to root_path
    end
  end

end
