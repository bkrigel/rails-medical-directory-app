# frozen_string_literal: true

class PrescriptionsController < ApplicationController
  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      redirect_to specialty_doctor_path(current_user.role.specialty,
                                        current_user.role)
    else
      render :new
    end
  end

  def edit
    @prescription = Prescription.find_by(id: params[:id])
  end

  def update
    @prescription = Prescription.find_by(id: params[:id])
    if @prescription.update(prescription_params)
      redirect_to specialty_doctor_path(current_user.role.specialty,
                                        current_user.role)
    else
      render :edit
    end
  end

  def destroy
    prescription = Prescription.find_by(id: params[:id])
    prescription.destroy
    redirect_to specialty_doctor_path(current_user.role.specialty,
                                      current_user.role)
  end

private

  def prescription_params
    params.require(:prescription).permit(
      :drug,
      :dosage_in_milligrams,
      :appointment_id
    )
  end
end
