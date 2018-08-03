class PatientsController < ApplicationController

  def show
    @patient = Patient.find_by(id: params[:id])
  end

end
