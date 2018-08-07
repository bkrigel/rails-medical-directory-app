class DoctorSignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    )
    user.role = Doctor.new(
      specialty_id: params[:user][:role_attributes][:specialty],
      location_city: params[:user][:role_attributes][:location_city],
      years_in_practice: params[:user][:role_attributes][:years_in_practice],
      first_name: params[:user][:role_attributes][:first_name],
      last_name: params[:user][:role_attributes][:last_name]
    )
    if user.save && user.role.save
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
    if @user.update(
        email: params[:user][:email],
        password: params[:user][:password],
        password_confirmation: params[:user][:password_confirmation]
      ) && @user.role.update(
        specialty_id: params[:user][:role_attributes][:specialty],
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
  # def doctor_signup_params
  #   params.require(:user).permit(:email, :password, :password_confirmation)
  # end
end
