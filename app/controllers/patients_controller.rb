class PatientsController < ApplicationController

  def show
    @patient = Patient.find_by_id(params[:id])
    @ailments = @patient.ailments
    @appointments = @patient.appointments
  end

end
