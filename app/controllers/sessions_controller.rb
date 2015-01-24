class SessionsController < ApplicationController

  def new
    redirect_to games_path if current_user
  end

  def create

    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id.to_s
      redirect_to games_path
    else
      flash.now[:danger] = "Username or password is incorrect"
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end


end
