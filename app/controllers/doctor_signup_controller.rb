class DoctorSignupController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(email: params[:user][:email],
                    password: params[:user][:password],
                    password_confirmation: params[:user][:password_confirmation]
                  )
    user.role = Doctor.create
    if user.save
      session[:user_id] = user.id
      redirect_to specialties_path
    else
      redirect_to doctor_signup_path
    end
  end

  # private
  #
  # def doctor_signup_params
  #   params.require(:user).permit(:email, :password, :password_confirmation)
  # end
end
