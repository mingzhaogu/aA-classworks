class PostsController < ApplicationController

  before_action :require_login

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save

      params[:post][:sub_ids].each do |sub_id|
        PostSub.create!(post_id: @post.id, sub_id: sub_id)
      end

      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to post_url(@post)
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_ids)
  end
end
