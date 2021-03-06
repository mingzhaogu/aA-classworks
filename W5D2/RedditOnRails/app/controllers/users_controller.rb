class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
