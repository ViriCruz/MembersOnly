# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authorize_user, only: %i[new create]

  def new; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save # success
      flash.now[:success] = 'Post created succesfully'
      redirect_to posts_url
    else # failure
      flash.now[:danger] = "Can't create post. Check input."
      redirect_to post_create
    end
  end

  def index
    @posts = Post.all
    current_user
  end

  private

  def post_params
    params.require(:post).permit(:body, :title)
  end

  def authorize_user
    return if signed_in?

    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end
end
