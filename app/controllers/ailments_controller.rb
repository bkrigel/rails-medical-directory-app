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

  def destroy
    @ailment = Ailment.find_by(id: params[:id])
    @ailment.destroy
    redirect_to patient_path(@ailment.patient)
  end

  def resolve_ailment
    @ailment = Ailment.find_by(id: params[:id])
    @ailment.resolved_status = true
    @ailment.save
    redirect_to patient_path(@ailment.patient)
  end

  def unresolve_ailment
    @ailment = Ailment.find_by(id: params[:id])
    @ailment.resolved_status = false
    @ailment.save
    redirect_to patient_path(@ailment.patient)
  end

  private

  def ailment_params
    params.require(:ailment).permit(
      :first_noticed_on,
      :description
    )
  end

end
