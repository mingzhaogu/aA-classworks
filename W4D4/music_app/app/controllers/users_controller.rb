class UsersController < ApplicationController
  def new
    if logged_in?(current_user)
      redirect_to user_url(current_user.id)
    else
      render :new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
