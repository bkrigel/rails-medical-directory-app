class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      if @user.role_type == "Doctor"
        redirect_to doctor_path(@user)
      else
        redirect_to patient_path(@user)
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear if session[:user_id]
    redirect_to root_url
  end
end
