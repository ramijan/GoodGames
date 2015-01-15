class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id.to_s
      redirect_to login_path
    else
      render :new
    end

  end

  def destroy
  end


end
