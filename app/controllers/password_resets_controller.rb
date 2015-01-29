class PasswordResetsController < ApplicationController
  
  # before_action :authorize_password_reset, only: [:edit]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user
      @token = PasswordReset.create(email: params[:email])
      UserMailer.password_reset(@token).deliver
    end

    redirect_to login_path, :flash => {:info => "Email sent with password reset instructions"}
  end

  def edit
    @token = PasswordReset.find_by(token: params[:id])
    if @token.nil?
      redirect_to login_path, :flash => {:danger => "Invalid password reset url"}
    elsif @token.created_at < 2.hours.ago
      redirect_to login_path, :flash => {:warning => "Password reset has expired"}
    else
      @user = User.find_by(email: @token.email)
    end
  end

  def update
    @token = PasswordReset.find_by(token: params[:id])
    @user = User.find_by(email: @token.email)
    if @user.update(params.require(:user).permit(:password, :password_confirmation))
      redirect_to login_path, :flash => {:success => "Password successfully reset!"}
    else
      flash.now[:danger] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private
  def authorize_password_reset
    token_exists = PasswordReset.find_by(token: params[:token])
    redirect_to login_path, :flash => {:danger => "Invalid password reset link"} unless token_exists
  end
end