class PatientSignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    )
    user.role = Patient.new(
      first_name: params[:user][:role_attributes][:first_name],
      last_name: params[:user][:role_attributes][:last_name]
    )
    if user.save && user.role.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to patient_signup_path
    end
  end
end
