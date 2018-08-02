class PatientSignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(email: params[:user][:email],
                    password: params[:user][:password],
                    password_confirmation: params[:user][:password_confirmation]
                  )
    user.role = Patient.new
    if user.save
      session[:user_id] = user.id
      redirect_to specialties_path
    else
      redirect_to new_patient_signup_path
    end
  end
end
