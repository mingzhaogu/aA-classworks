class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password],
    )

    if @user
      login!(@user)
      flash[:success] = "Successfully Logged In!!!!!!!"
      redirect_to cats_url
    else
      flash.now[:errors] = ["Not valid credentials :("]
      render :new
    end
  end

  def destroy
    logout!
    flash[:success] = "Successfully Logged Out"
    redirect_to new_sessions_url
  end


end
