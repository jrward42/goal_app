class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_credentials(session_params[:username], session_params[:password])
    if user.nil?
      flash[:errors] = "Username or Password not found"
      redirect_to new_session_url
    else
      log_in!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
