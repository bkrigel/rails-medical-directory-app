class AilmentsController < ApplicationController

  def new
    @ailment = Ailment.new
  end

  def create
    ailment = Ailment.new(ailment_params)
    ailment.patient = current_user.role

    if ailment.save
      redirect_to patient_path(ailment.patient)
    else
      redirect_to new_ailment_path
    end
  end

  def edit
    @ailment = Ailment.find_by(id: params[:id])
  end

  def resolve_ailment
    @ailment = Ailment.find_by(id: params[:id])
    @ailment.resolved_status = true
    redirect_to idk
  end

  private

  def ailment_params
    params.require(:ailment).permit(
      :first_noticed_on,
      :description
    )
  end

end
