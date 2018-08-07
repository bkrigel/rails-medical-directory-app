class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create
    appointment = Appointment.new(
      scheduled_for: DateTime.strptime("#{params[:appointment][:scheduled_for]} #{params[:appointment]["scheduled_for(4i)"]}:#{params[:appointment]["scheduled_for(5i)"]}", "%Y-%m-%d %H:%M"),
      duration_in_minutes: params[:appointment][:duration_in_minutes],
      doctor_id: params[:appointment][:doctor],
      ailment_id: params[:appointment][:ailment],
      patient_id: current_user.role.id
    )
    if appointment.save
      redirect_to patient_path(appointment.patient)
    else
      redirect_to new_appointment_path
    end
  end

  def edit
    @appointment = Appointment.find_by(id: params[:id])
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.update(
      scheduled_for: DateTime.strptime("#{params[:appointment][:scheduled_for]} #{params[:appointment]["scheduled_for(4i)"]}:#{params[:appointment]["scheduled_for(5i)"]}", "%Y-%m-%d %H:%M"),
      duration_in_minutes: params[:appointment][:duration_in_minutes],
      doctor_id: params[:appointment][:doctor],
      ailment_id: params[:appointment][:ailment],
      patient_id: current_user.role.id
    )
      redirect_to patient_path(@appointment.patient)
    else
      redirect_to edit_appointment_path(@appointment)
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
    @doctor = @appointment.doctor
    @patient = @appointment.patient
    unless current_user.role == @appointment.patient || current_user.role == @appointment.doctor
      redirect_to root_path
    end
  end

end
