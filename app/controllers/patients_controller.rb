class PatientsController < ApplicationController

  def show
    @patient = Patient.find_by(id: params[:id])
    @doctors = @patient.doctors
    @ailments = @patient.ailments
    @appointments = @patient.appointments
    @prescriptions = Prescription.all.select do |prescription|
      @appointments.include?(prescription.appointment)
    end
    unless current_user.role == @patient || @doctors.include?(current_user.role)
      redirect_to root_path
    end
  end

end
