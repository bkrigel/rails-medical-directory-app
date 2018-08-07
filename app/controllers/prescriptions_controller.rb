class PrescriptionsController < ApplicationController

  def new
    @prescription = Prescription.new
  end

  def create
    prescription = Prescription.new(
      drug: params[:prescription][:drug],
      dosage_in_milligrams: params[:prescription][:dosage_in_milligrams],
      appointment_id: params[:prescription][:appointment]
    )
    if prescription.save
      redirect_to specialty_doctor_path(prescription.appointment.doctor.specialty,
                            prescription.appointment.doctor)
    else
      redirect_to new_prescription_path
    end
  end

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
