class SpecialtiesController < ApplicationController
  def index
    @specialties = Specialty.all
  end

  def show
    @specialty = Specialty.find_by(id: params[:id])
    @doctors = []
    Doctor.all.select do |doctor|
      if doctor.specialty_id == @specialty.id
        @doctors << doctor
      end
    end
  end
end
