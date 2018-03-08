class SessionController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      log_in_user!(@user)
      redirect_to users_url
    else
      flash[:errors] = ["Invalid login!"]
      render :new
    end
  end

  def destroy
    logout!
  end
end
