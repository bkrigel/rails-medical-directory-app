class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create
    appointment = Appointment.new(appointment_params)
    appointment.scheduled_for = DateTime.strptime("#{params[:appointment][:scheduled_for]} #{params[:appointment]["scheduled_for(4i)"]}:#{params[:appointment]["scheduled_for(5i)"]}", "%Y-%m-%d %H:%M")
    appointment.patient_id = current_user.role.id
    if appointment.save
      redirect_to patient_path(appointment.patient)
    else
      redirect_to new_appointment_path
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

  def edit
    @appointment = Appointment.find_by(id: params[:id])
  end

  def update
    appointment = Appointment.find_by(id: params[:id])
    appointment.update(appointment_params)
    appointment.scheduled_for = DateTime.strptime("#{params[:appointment][:scheduled_for]} #{params[:appointment]["scheduled_for(4i)"]}:#{params[:appointment]["scheduled_for(5i)"]}", "%Y-%m-%d %H:%M")
    appointment.patient_id = current_user.role.id
    if appointment.save
      redirect_to patient_path(appointment.patient)
    else
      redirect_to edit_appointment_path(appointment)
    end
  end

  def destroy
    @appointment = Appointment.find_by(id: params[:id])
    @appointment.destroy
    if current_user.role_type == "Doctor"
      redirect_to specialty_doctor_path(current_user.role.specialty, current_user.role)
    else
      redirect_to patient_path(current_user.role)
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :duration_in_minutes,
      :doctor_id,
      :ailment_id
    )
  end

end
