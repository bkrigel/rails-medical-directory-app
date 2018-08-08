# frozen_string_literal: true

class SpecialtiesController < ApplicationController
  def index
    @specialties = Specialty.all
  end

  def show
    @specialty = Specialty.find_by(id: params[:id])
    @doctors = []
    Doctor.all.select do |doctor|
      @doctors << doctor if doctor.specialty_id == @specialty.id
    end
  end
end
