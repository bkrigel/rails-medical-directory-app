class SessionsController < ApplicationController
  # def new
  #   @doctor = Doctor.new
  #   @patient = Patient.new
  # end
  #
  # def create
  #   @doctor = Doctor.find_by(id: params[:doctor][:id])
  #   if @doctor.authenticate(params[:doctor][:password])
  #     session[:doctor_id] = @doctor.id
  #     redirect_to doctor_path(@doctor)
  #   else
  #     redirect_to "/signup"
  #   end
  # end
  #
  # def destroy
  #   session.clear
  #   redirect_to root_url
  # end
end
