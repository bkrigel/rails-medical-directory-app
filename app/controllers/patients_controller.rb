class PatientsController < ApplicationController

  def show
    @patient = Patient.find_by_id(params[:id])
    @doctors = @patient.doctors
    if current_user.role == @patient || @doctors.include?(current_user.role)
      @ailments = @patient.ailments
      @appointments = @patient.appointments
    else
      redirect_to root_path
    end
  end

end
