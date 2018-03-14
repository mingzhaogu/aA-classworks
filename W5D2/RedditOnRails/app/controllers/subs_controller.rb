class SubsController < ApplicationController

  before_action :require_current_owner, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
  end

  def update
    @sub = current_user.subs.find(params[:id])

    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to edit_sub_url
    end
  end

  def destroy
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_current_owner
    @sub = Sub.find(params[:id])
    redirect_to sub_url(@sub) unless current_user == @sub.moderator
  end

end
