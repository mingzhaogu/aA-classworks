class SessionsController < ApplicationController
  def new
    if logged_in?(current_user)
      redirect_to user_url(current_user.id)
    else
      render :new
    end
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid login!"]
      render :new
    end
  end

  def destroy
    logout!
    flash[:success] = 'Suceessfully logged out!'
    redirect_to new_user_url
  end
end
