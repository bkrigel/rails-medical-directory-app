# frozen_string_literal: true

class DoctorSignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.role = Doctor.new(
      specialty_id: params[:user][:role_attributes][:specialty_id],
      location_city: params[:user][:role_attributes][:location_city],
      years_in_practice: params[:user][:role_attributes][:years_in_practice],
      first_name: params[:user][:role_attributes][:first_name],
      last_name: params[:user][:role_attributes][:last_name]
    )
    if user.valid? && user.role.valid?
      user.save
      user.role.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to doctor_signup_path
    end
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
    @user = User.find_by(id: current_user.id)
    if @user.update(user_params) && @user.role.update(
      specialty_id: params[:user][:role_attributes][:specialty_id],
      location_city: params[:user][:role_attributes][:location_city],
      years_in_practice: params[:user][:role_attributes][:years_in_practice],
      first_name: params[:user][:role_attributes][:first_name],
      last_name: params[:user][:role_attributes][:last_name]
    )
      redirect_to specialty_doctor_path(current_user.role.specialty, current_user.role)
    else
      redirect_to doctor_edit_path(current_user)
    end
  end

  # private
  #
  # def doctor_params
  #   params.require(:user).permit(role_attributes: [
  #       :specialty_id,
  #       :location_city,
  #       :years_in_practice,
  #       :first_name,
  #       :last_name
  #     ]
  #   )
  # end
end
