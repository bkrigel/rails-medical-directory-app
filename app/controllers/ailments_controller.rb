class AilmentsController < ApplicationController

  def new
    @ailment = Ailment.new
  end

  def create
    ailment = Ailment.new(
      first_noticed_on: params[:ailment][:first_noticed_on],
      description: params[:ailment][:description],
      patient_id: current_user.role.id
    )
    if ailment.save
      redirect_to patient_path(ailment.patient)
    else
      redirect_to new_ailment_path
    end
  end

end
