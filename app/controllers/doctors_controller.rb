# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find_by(id: params[:id])
    @patients = @doctor.patients
    @appointments = @doctor.appointments
    @prescriptions = Prescription.all.select do |prescription|
      @appointments.include?(prescription.appointment)
    end
  end
end
