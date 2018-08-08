# frozen_string_literal: true

class PatientSignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.role = Patient.new(
      first_name: params[:user][:role_attributes][:first_name],
      last_name: params[:user][:role_attributes][:last_name]
    )
    if user.valid? && user.role.valid?
      user.save
      user.role.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to patient_signup_path
    end
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
    user = User.find_by(id: current_user.id)
    if user.update(user_params) && user.role.update(
      first_name: params[:user][:role_attributes][:first_name],
      last_name: params[:user][:role_attributes][:last_name]
    )
      redirect_to patient_path(current_user.role)
    else
      redirect_to patient_edit_path(current_user)
    end
  end

  # private
  #
  # def patient_params
  #   params.require(:user).permit(role_attributes: [
  #       :first_name,
  #       :last_name
  #     ]
  #   )
  # end
end
