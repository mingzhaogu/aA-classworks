class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to users_url
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  def show
  end

  # def edit
  # end
  #
  # def update
  # end
  #
  # def index
  # end
  #
  # def destroy
  # end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
